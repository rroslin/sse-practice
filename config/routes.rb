Rails.application.routes.draw do
  get 'outcome_events/index', to: 'outcome_events#index'
  resources :outcomes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
