Depot::Application.routes.draw do



  devise_for :admin_users, ActiveAdmin::Devise.config
    root to: 'store#index', as: 'store'
  ActiveAdmin.routes(self)

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
    root to: 'store#index', as: 'store'
  ActiveAdmin.routes(self)

  
  

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

  match 'brand_new/' => 'store#brand_new'
  match 'editors_pick/' => 'store#editors_pick'
  match 'most_popular/' => 'store#most_popular'

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
