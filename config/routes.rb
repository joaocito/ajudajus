Rails.application.routes.draw do
  devise_for :lawyers
  devise_for :authors
  resources :suits
  resources :lawyers
  resources :authors
  resources :pages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#index"
end
