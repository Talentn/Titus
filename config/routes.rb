Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :expenses do
    collection do
      get :stats
    end
  end
  # Health status check
  get "up" => "rails/health#show", as: :rails_health_check

  # Define route for stats before the resources block
  get 'expenses/stats', to: 'expenses#stats', as: :expense_stats

  # Define routes for expenses resource
  resources :expenses

  # Set root path to the list of expenses
  root "expenses#index"
end
