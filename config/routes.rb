Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#home"
  resources :user, only: [:show, :update]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
