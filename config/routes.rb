# frozen_string_literal: true

Rails.application.routes.draw do
  resources :result_types
  resources :subjects
  resources :grades do
    get :result, on: :collection
  end
  resources :cash_entries
  resources :students do
    resources :results, only: %i[index show]
    resources :fee_details, only: %i[new edit create update]
    member do
      post :result
      get :new_result
    end
    collection do
      get :unpaid_list
    end
  end
  resources :fee_details, only: %i[index show destroy]
  devise_for :users
  root 'home#index'
  get 'home#settings', to: 'home#settings', as: :settings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
