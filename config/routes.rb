Rails.application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    root 'products#index'
    resources :products

    devise_for :user, :path => '', :path_names => {
      :sign_in => "login", :sign_out => "logout", :sign_up => "register", edit: 'profile'}

    #shop
    get "shop" => "products#index", as: "shop"
    get "sort" => "products#sort", as: "sort"
    get "filter" => "products#filter", as: "filter"
    get "search" => 'products#search', :as => "search"

    #staticpages
    get "about" => "static_pages#about", as: "about"
    get "contact" => "static_pages#contact", as: "contact"
    get "help" => "static_pages#help", as: "help"

    post 'locale', to: 'locales#update'

    #darkmode
    post "dark", to: "appearance#dark", as: "dark"
    post "light", to: "appearance#light", as: "light"

  end



end
