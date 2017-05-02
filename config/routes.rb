Rails.application.routes.draw do
    resources :points
    resource :point_distances, only: [:show, :create]    
    resource :cost, only: [:show]
end