Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "public#index"
  resources :users
  resources :flats

  put "/users/update/:id",
    to: "users#update",
    as: :update_flat
end
