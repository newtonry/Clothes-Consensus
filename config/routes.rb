ClothesConsensus::Application.routes.draw do
  resources :looks

  root :to => "static_pages#index" #this is here temporarily. root :to must be defined for Devise

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
end
