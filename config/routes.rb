Rails.application.routes.draw do
  devise_for :workers
  root to: 'salondoors#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
