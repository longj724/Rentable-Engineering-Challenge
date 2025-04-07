Rails.application.routes.draw do
  resources :properties

  resources :property_feed, only: [] do
    collection do
      post 'import', as: :import
    end
  end

  root "properties#index"

  get "up" => "rails/health#show", as: :rails_health_check
  mount MissionControl::Jobs::Engine, at: "/jobs"
end
