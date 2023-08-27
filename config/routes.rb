Rails.application.routes.draw do
  root to: 'pages#home'

  namespace :api do
    namespace :v1 do
      resources :instruments
      resources :bookings, only: %i[create destroy]
    end
  end

  get '*path', to: 'pages#home', via: :all
end
