Rails.application.routes.draw do

  # Root to
  root "pages#index"
  # root "listings#index"

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  # Listings routes
  resources :listings do
    resources :reservations, only: [:show, :create, :destroy]
  end

  resources :tags

  # get "/search" => "listings#search"


  # Clearance routes
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  get '/reservations/:id/braintree/new' => 'braintree#new', as: 'braintree_new'
  post '/reservations/:id/braintree/checkout' => 'braintree#checkout', as:'braintree_checkout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
