Rails.application.routes.draw do

  #root
  root 'startpages#index'

  #startpage
  get "startpage" => "startpages#index", as: "startpage"

  #static_pages
  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/help'

  get "about" => "static_pages#about", as: "about"
  get "contact" => "static_pages#contact", as: "contact"
  get "help" => "static_pages#help", as: "help"
end
