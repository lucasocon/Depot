Depot::Application.routes.draw do

  devise_for :buyers

  match 'auth/:provider/callback', to: 'sessions#facebook'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  get 'admin' => 'admin#index'

    controller :sessions do
      get    'login' => :new
      post   'login' => :create
      delete 'logout' => :destroy
    end


  get "admin/index"

  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  resources :users

  resources :products do
    get :who_bought, on: :member
  end

  scope '(:locale)' do
    resources :orders
    resources :line_items
    resources :carts
    root to: 'store#index', as: 'store'
    get "store/index"
  end


end
