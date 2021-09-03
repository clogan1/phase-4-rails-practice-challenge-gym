Rails.application.routes.draw do
  resources :memberships, only: [:create]
  resources :clients, only: [:show, :index, :create, :update]
  resources :gyms, only: [:show, :destroy, :index, :create, :update]
 
end
