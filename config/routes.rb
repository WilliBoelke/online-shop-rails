Rails.application.routes.draw do

  #root
  root 'products#index'

  #shop
  get "shop" => "products#index", as: "shop"
  get "sort" => "products#sort", as: "sort"
  get "filter" => "products#filter", as: "filter"
  get "search" => 'products#search', :as => "search"
  resources :products

  #staticpages
  get "contact" => "static_pages#contact", as: "contact"
  get "help" => "static_pages#help", as: "help"
  get "about" => "static_pages#about", as: "about"

  #darkmode
  post 'dark' => 'application#dark', as: :dark
  post 'light' => 'application#light', as: :light
end
