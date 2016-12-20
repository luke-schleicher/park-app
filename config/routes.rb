Rails.application.routes.draw do

  root 'sessions#new'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  resource :session, only: [:new, :create, :destroy]

  resources :players do
    resources :activities
    resources :parks
  end

  resources :parks, only: [:show]
  resources :activities, only: [:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
