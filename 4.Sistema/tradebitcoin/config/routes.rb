Rails.application.routes.draw do
  resources :accounts
  devise_for :users
  resources :clients
  resources :users

  get 'sobre' => 'index#sobre', as: :sobre

  get 'ajuda' => 'index#ajuda', as: :ajuda

  get 'contato' => 'index#contato', as: :contato

  root "index#index"
end
