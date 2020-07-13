Rails.application.routes.draw do
  get "books/sample" => "books#sample"
  get "users" => "users#users"
  get "home/about" => "books#sample"
  get "users/:id/edit", to: "users#edit", as: "edit_user"
  devise_for :users
  resources :books
  resources :users, only: [:show, :edit, :update]
  root "books#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
