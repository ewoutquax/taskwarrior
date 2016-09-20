Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :tasks, only: :show
    end
  end

  resources :tasks, only: [:new, :create, :edit, :update] do
    collection do
      post :sync
    end
  end

  root to: 'home#index'
end
