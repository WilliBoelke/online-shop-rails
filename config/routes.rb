Rails.application.routes.draw do
  get 'carts/show'
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root
  root 'products#index'

  #shop
  get "shop" => "products#index", as: "shop"

  resource :cart, only: [:show] do
    put 'add/:movie_id', to: 'carts#add', as: :add_to
    put 'remove/:movie_id', to: 'carts#remove', as: :remove_from
  end
  #static_pages

  get "about" => "static_pages#about", as: "about"
  get "contact" => "static_pages#contact", as: "contact"
  get "help" => "static_pages#help", as: "help"
end
