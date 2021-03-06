class BooksController < ApplicationController
	before_action :authenticate_user!, only: [:index, :create, :edit, :show, :update, :destroy]
	before_action :correct_user, only: [:edit, :update]
	def top
		
	end

	def sample
		
	end

	

	def index
		@books = Book.all
		@users = User.all
		@book = Book.new
		@user = User.find(current_user.id)
	end

	def create
		@users = User.all
		@user = User.find(current_user.id)
		@books = Book.all
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "Book was successfully created."
			redirect_to book_path(@book.id)
		else
			render "books/index"
		end
	end

	def edit
		@user = User.find(current_user.id)
		@book = Book.find(params[:id])
		@books = Book.all
		@users = User.all
	end

	def show
		@book = Book.find(params[:id])
		@bookn = Book.new
		@user = User.find(@book.user_id)
		@books = Book.all
		@users = User.all
		@userc = User.find(current_user.id)
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to book_path(params[:id])
			flash[:notice] = "Book was successfully updated."
		else
			render "books/edit"
		end
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end

	def correct_user
		book = Book.find(params[:id])
		redirect_to books_path if current_user.id != book.user_id
	end
end
