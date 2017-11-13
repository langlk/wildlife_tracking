Rails.application.routes.draw do
  root :to => 'animals#index'
  resources :animals do
    resources :sightings
  end

  resources :regions do
    resources :sightings
  end

  resources :sightings

  post 'report', to: "sightings#report"
  get 'report', to: "sightings#index"
end
