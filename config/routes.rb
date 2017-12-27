Rails.application.routes.draw do
  root to: 'recipes#index'
  get '/about', to: 'pages#about', as: 'about'
  resources :recipes
end
