Rails.application.routes.draw do
  require "sidekiq/web"

  mount Sidekiq::Web => "/sidekiq"

  devise_for :users

  resources :jobs do
    resources :job_applications, only: [:new, :index, :show, :edit, :create]
  end

  resources :companies

  resources :candidates, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  resources :resumes, only: [:index, :new, :create, :show, :edit, :update] do
    member do
      get :preview
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "jobs#index" # ou outra página inicial
end