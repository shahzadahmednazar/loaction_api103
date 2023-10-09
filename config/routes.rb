Rails.application.routes.draw do
  resources :users do
    resources :locations, only: [:create]
    get 'generate_routes', to: 'routes#generate_routes'

  end
end
