Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  # devise_scope :user do
  #   root 'devise/sessions#new'
  # end

  resources :posts
  resources :articles
  get 'default_role', to: 'articles#default_role'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
