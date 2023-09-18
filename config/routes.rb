Rails.application.routes.draw do
  get 'user_details/new'
  post 'user_details/create'
  resources :user_details
 
  devise_for :users, controllers: { registrations: 'registrations' }
  get '/admin/index', to: 'admin#index'
  # post "/users/sign_up", to:'admin#index'
  get "/product_versions" , to: "product_versions#index"
  resources :product_versions, only: [:new, :create, :show]
  resources :product_lines, only: [:new, :create, :show]
 
  resources :product_lines
  resources :mcqs
  resources :test_user
  resources :students 
  resources :courses
  resources :enrollments
  resources :users
  resources :admin, only: [:index, :show, :edit, :update]
  resources :essays
  root "students#index"
  # root "admin#index"
end
