Rails.application.routes.draw do
  resources :accounts
  devise_for :users
  resources :clients
  resources :users

  get 'sobre' => 'index#sobre'

  get 'ajuda' => 'index#ajuda'

  get 'contato' => 'index#contato'

  root "index#index"
end
