Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resource :session, only: [:create, :destroy, :new]
  resources :bands, only: [:show, :index, :edit, :update, :destroy, :create, :new]
end
