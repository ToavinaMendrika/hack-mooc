Rails.application.routes.draw do
  root 'page#index'
  devise_for :users
  namespace :api do
    post 'login', to: 'session#create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
