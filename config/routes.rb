Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :categories do
    resources :tasks
  end

  get 'tasks_for_today', to: 'tasks#tasks_for_today', as: :tasks_for_today

end
