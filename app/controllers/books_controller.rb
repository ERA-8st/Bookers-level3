class BooksController < ApplicationController
	def top
		
	end

	def index
		@books = Book.all
		@book = Book.new
	end

	def create
		@books = Book.all
		@book = Book.new(params[:id])
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "Book was successfully created."
			redirect_to book_path(@book.id)
		else
			render "books/index"
		end
	end

	def show
		@book = Book.find(params[:id])
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
