Rails.application.routes.draw do

  root 'session#new'

  resource :session, only: [:new, :create, :destroy]

  resources :players

  get 'login' => 'session#new'
  get 'logout' => 'session#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
