Rails.application.routes.draw do
  resources :reviewers
  resources :reviews
  resources :races
  devise_for :users
  root 'info#index'
  get 'info/mypage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
