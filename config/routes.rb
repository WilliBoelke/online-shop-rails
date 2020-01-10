Rails.application.routes.draw do

  root 'products#index'

  resources :products

  #shop
  get "shop" => "products#index", as: "shop"

  get "about" => "static_pages#about", as: "about"

  get "sort" => "products#sort", as: "sort"

  get "filter" => "products#filter", as: "filter"

  get "search" => 'products#search', :as => "search"


  #staticpages
  get "contact" => "static_pages#contact", as: "contact"

  get "help" => "static_pages#help", as: "help"
end
