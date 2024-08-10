Rails.application.routes.draw do
  resources :subcategories
  resources :products
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  # get '/', :controller => 'products', :action => "index"

  # Set the root path route ("/")
  root "products#index"

  # Custom paths
  get 'product', to: 'products#index'
  get 'category', to: 'categories#index'
  get 'subcategory', to: 'subcategories#index'

  get 'products/by_category/:category_id', to: 'products#index', as: 'by_category_products'
end
