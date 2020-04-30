Rails.application.routes.draw do
  resources :drawings
  resources :user_conversations
  resources :messages
  resources :conversations
  resources :users, only: [:create, :index]
  # post '/signup', to: 'users#create'
  post '/auth', to: 'auth#create'
  get '/current_user', to: 'auth#show'

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
