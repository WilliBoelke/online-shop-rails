Rails.application.routes.draw do
  get 'static_pages/about'
  get 'static_pages/help'
  get 'static_pages/contact'
  #root
  root 'shops#index'

  #shop
  get "shop" => "shops#index", as: "shop"

  #static_pages
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/help'

  get "about" => "static_pages#about", as: "about"
  get "contact" => "static_pages#contact", as: "contact"
  get "help" => "static_pages#help", as: "help"
end
