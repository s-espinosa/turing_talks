Rails.application.routes.draw do
  root to: 'sessions#new'
  get 'login', to: 'sessions#new'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'dashboard', to: 'dashboards#show'

  namespace 'admin' do
    get 'dashboard', to: 'dashboards#show'
    resources :innings, only: [:show, :new, :create] do
      resources :presentations, only: [:new, :create, :edit, :update]
    end
  end
end
