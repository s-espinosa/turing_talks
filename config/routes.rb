Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'dashboard', to: 'dashboards#show'

  namespace 'admin' do
    get 'dashboard', to: 'dashboards#show'
  end
end
