Rails.application.routes.draw do
  
  resources :pedido_detalhes
  resources :pedidos
  resources :produtos
  resources :categs
  resources :enderecos
  resource :users
  post "auth/register", to: "users#create"
  post "auth/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
 
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
end
