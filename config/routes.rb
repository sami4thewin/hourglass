Rails.application.routes.draw do
  # get 'user/show'

  get 'static/home'
  root 'static#home'

  # get 'users/:user_id/links/:id', to: 'links#show'

  resources :list_tasks
  resources :tasks
  resources :lists
  resources :user_videos
  resources :videos
  resources :user_links
  resources :links
  # devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users do
    resources :links
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
