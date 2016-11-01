Rails.application.routes.draw do
  mount Flipper::UI.app(FlipperDemo.flipper) => '/flipper'

  devise_for :users
  resources :lists do
    resources :items, shallow: true
    resources :imports, only: [:new, :create]
  end

  root to: "lists#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
