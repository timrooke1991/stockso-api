Rails.application.routes.draw do
  scope :api do
    resources :users
    resources :posts
    resources :stocks, param: :ticker

  end
end
