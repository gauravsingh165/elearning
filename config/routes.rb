Rails.application.routes.draw do
  get 'courses/index'
  get 'courses/show'
  get 'courses/new'
  get 'courses/create'
  get 'courses/edit'
  get 'courses/update'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
