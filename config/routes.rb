Rails.application.routes.draw do
  devise_for :accounts
  root to: 'home#index'

  #post 'auth_user' => 'authentication#authenticate_user'
  #get 'home' => 'home#index'
  get 'home/index'

  resources :todos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  	namespace :v1 do
      post 'auth_user/register', to: 'account#register'
  		post 'auth_user' => 'authentication#authenticate_user'
  		get 'todos', to: 'todos#index'
  	end
  end
end
