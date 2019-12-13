Rails.application.routes.draw do

  devise_for :users
  #root
  root 'shops#index'

  #shop
  get "shop" => "shops#index", as: "shop"

  #static_pages

  get "about" => "static_pages#about", as: "about"
  get "contact" => "static_pages#contact", as: "contact"
  get "help" => "static_pages#help", as: "help"
end
