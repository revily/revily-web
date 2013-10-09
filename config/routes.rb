Revily::Web::Application.routes.draw do
  root :to => 'home#index'
  
  get 'sign_in' => 'sessions#new'
  post 'sign_in' => 'sessions#create'
  delete 'sign_out' => 'sessions#destroy'

  
  resources :users do
    resources :contacts
  end

  # TODO: remove this
  get '_inspect' => 'sessions#_inspect'
end
