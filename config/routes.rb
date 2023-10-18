Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  
  get 'top/main'
  post 'top/login'
  root 'top#main'
  get 'top/logout'
  
end
