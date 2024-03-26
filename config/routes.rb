Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "pages#home"

  resources :recipes do
    resources :my_recipes, only: [:create]
  end

  #TODO: add the my_recipes model and controller
    # get "/my_recipes", to: "my_recipes#index"
    # delete "/my_recipes/:id", to: "restaurants#destroy"
    #TODO: Think about when we want to destroy a recipe saved. What's actual the path ?
    # resources :my_recipes, only: [:index, :destroy]
end
