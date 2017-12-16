Rails.application.routes.draw do
  resources :shares
  scope :api do
    resources :users
    resources :posts
    resources :shares, param: :ticker

  end
end
