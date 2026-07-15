Rails.application.routes.draw do
  get "job_aplication/index"
  get "job_aplication/edit"
  get "job_aplication/show"
  get "job_aplication/new"
  require "sidekiq/web"

  mount Sidekiq::Web => "/sidekiq"

  devise_for :users

  resources :jobs do
    resources :job_applications, only: [:new, :create]
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