Rails.application.routes.draw do
  #get 'welcome/home'
  root 'welcome#home'

  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { omniauth_callbacks: "omniauth_callbacks" }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  
  resources :books do
    resources :reviews
  end
  
  resources :reviews, only: :destroy
  
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/edit', to: 'users#edit', as: 'user_edit'
  delete '/users/:id', to: 'users#destroy'
  patch '/users/:id', to: 'users#updateinfo'
end
