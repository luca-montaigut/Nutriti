Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#home"
  get '/landing', to: "static_pages#landing"
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  
  scope 'users', module: 'users' do
    resources :users, only: [:show, :edit, :update]
    resources :meals
    resources :userboards, only: [:show], as: 'userboard'
  end

  scope 'admin', module: 'admin', as: 'admin' do
    resources :dashboard, only: [:index]
    resources :recipes
  end

end