Rails.application.routes.draw do
  resources :grades
  resources :cash_entries
  resources :students do
    resources :fee_details, only: %i[new edit create update]
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
