Rails.application.routes.draw do
  get 'histories/my_histories'
  resources :histories
  get 'users/sign_up', to: 'users#new'
  post 'users', to: 'users#create'
  get 'users/sign_in', to: 'sessions#new'
  resource :sessions, only:%I[create destroy]
  root "histories#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
