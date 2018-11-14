Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :locations, only: [:index]
      resources :reviews, only: [:destroy, :create, :update]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
