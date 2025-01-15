Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  #get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  #get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  ##DESARROLLO
  #get '/products', to: 'products#index' #Cuando alguien venga a barra products, mandar a un controlador
  #Dentro de la vista Index


  ##Página New
  #get '/products/new', to: 'products#new', as: :new_product
  #post '/products', to: 'products#create'

  #Página Edit
  #get '/products/:id/edit', to: 'products#edit', as: :edit_product
  # Dos puntos parametro dinamico

  #Página inicial
  #get '/products/:id', to: 'products#show', as: :product 

  #Página Update
  #patch '/products/:id', to: 'products#update'

  #Eliminación de producto
  #delete '/products/:id', to: 'products#destroy'

  #Todo lo anteriormente escrito es lo mismo que decir:
  resources :products
end
