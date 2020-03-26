Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#home"
  devise_for :users
  
  scope 'users', module: 'users' do
    resources :users, only: [:show, :edit, :update]
    resources :recipes, only: [:show]
    resources :breakfast, only: [:show, :edit, :update]
    resources :meals, except: [:new, :edit]
    resources :days, except: [:new, :edit]
    resources :weeks, only: [:show, :create, :update]
    resources :shopping_emails, only: [:show]
    resources :charges, only: [:new, :create, :index]
  end

  scope 'admin', module: 'admin', as: 'admin' do
    resources :dashboard, only: [:index]
    resources :recipes
  end

end
