Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'outings#index'
  resources 'politicians', only: [:index]
  resources :outings, only: [:index]
  resources :users, only: [:new, :create]
  get '/cart' => 'carts#index'
  get '/:name' => 'politicians#show', :as => 'categories'
  resources :carts, only: [:create, :destroy]
#   get 'outings' => 'outings#index'
end
