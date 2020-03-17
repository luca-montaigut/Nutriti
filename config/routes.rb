Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard/index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#home"
  resources :user, only: [:show, :edit, :update]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  scope 'admin', module: 'admin', as: 'admin' do
    resources :dashboard, only: [:index]
    resources :recipes
  end

end
