Rails.application.routes.draw do
  
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
  root 'products#index'
  resources :products

    #shop
    get "shop" => "products#index", as: "shop"
    get "sort" => "products#sort", as: "sort"
    get "filter" => "products#filter", as: "filter"
    get "search" => 'products#search', :as => "search"

    #staticpages
    get "about" => "static_pages#about", as: "about"
    get "contact" => "static_pages#contact", as: "contact"
    get "help" => "static_pages#help", as: "help"
    
    #darkmode
    post 'dark' => 'application#dark', as: :dark
    post 'light' => 'application#light', as: :light
    
    
    post 'locale', to: 'locales#update'
end
