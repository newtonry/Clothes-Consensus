ClothesConsensus::Application.routes.draw do
  devise_for :users
  root :to => "home#index" #this is here temporarily. root :to must be defined for Devise
end
