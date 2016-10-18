Rails.application.routes.draw do
  resources :list_tasks
  resources :tasks
  resources :lists
  resources :user_videos
  resources :videos
  resources :user_links
  resources :links
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
