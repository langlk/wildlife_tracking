Rails.application.routes.draw do
  root :to => 'animals#index'
  resources :animals do
    resources :sightings
  end

  resources :regions do
    resources :sightings
  end

  resources :sightings
end
