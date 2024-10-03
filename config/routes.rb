# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :hirers
    resources :appliers
    resources :welcomes, only: [:index]
    resources :roles

    root 'welcomes#index'
  end

  resources :users, only: [:index] do
    member do
      patch :change_admin_status
    end
  end

  devise_scope :user do
    root 'devise/sessions#new'
  end

  devise_for :users

  get 'up' => 'rails/health#show', as: :rails_health_check
  get 'service-worker' => 'rails/pwa#service_worker', as: :pwa_service_worker
  get 'manifest' => 'rails/pwa#manifest', as: :pwa_manifest
end
