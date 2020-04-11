Rails.application.routes.draw do
  root 'pages#home'
  resources :events
  resources :recurring_events
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
