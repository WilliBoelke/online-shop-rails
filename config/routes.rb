Rails.application.routes.draw do

  devise_for :user, :path => '', :path_names => {
    :sign_in => "login", :sign_out => "logout", :sign_up => "register" ,  edit: 'profile' }

  root 'products#index'

  resources :products

  #shop
  get "shop" => "products#index", as: "shop"
  get "sort" => "products#sort", as: "sort"
  get "filter" => "products#filter", as: "filter"
  get "search" => 'products#search', :as => "search"


  #staticpages
  get "contact" => "static_pages#contact", as: "contact"
  get "about" => "static_pages#about", as: "about"
  get "help" => "static_pages#help", as: "help"
end
