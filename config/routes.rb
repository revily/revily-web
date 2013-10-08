Revily::Web::Application.routes.draw do
  root :to => 'home#index'
  post 'sign_in' => 'sessions#create'
  delete 'sign_out' => 'sessions#destroy'

  resources :users do
    resources :contacts
  end
end
