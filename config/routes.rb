Rails.application.routes.draw do
  devise_for :workers
  root to: 'salondoors#index'
  resources :salons, only: [:index, :new, :create, :show]
  resources :salons do
    resources :comments, only: [:index, :new, :create]
  end
end
