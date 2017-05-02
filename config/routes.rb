Rails.application.routes.draw do
  resources :points do
  end

  resources :point_distances do
  end

  resources :cost do
  end
end