Rails.application.routes.draw do
  get 'books', to: 'books#mybooks' 
  devise_for :users
  root to: "books#index"
  resources :books do
    resources :reviews do
      resources :comments
    end
  end
end
