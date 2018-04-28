Rails.application.routes.draw do
  devise_for :lawyers
  devise_for :authors
  resources :suits
  resources :lawyers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
