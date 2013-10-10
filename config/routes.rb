Revily::Web::Application.routes.draw do
  resources :hooks

  root :to => 'home#index'

  get 'sign_in' => 'sessions#new'
  post 'sign_in' => 'sessions#create'
  delete 'sign_out' => 'sessions#destroy'

  resources :events, only: [ :index, :show ]

  resources :services do
    member do
      put 'enable'
      put 'disable'
    end
    resources :incidents do
      member do
        put 'acknowledge'
        put 'resolve'
        put 'trigger'
      end
    end
  end

  resources :incidents, only: [ :index, :show, :update, :destroy ] do
    member do
      put 'acknowledge'
      put 'resolve'
      put 'trigger'
    end
  end

  resources :policies do
    resources :policy_rules do
      collection do
        post :sort
      end
    end
  end

  resources :schedules do
    resources :schedule_layers, path: :layers, as: :layers
    resources :schedule_layers
    member do
      get 'policy_rules'
      get 'users'
      get 'on_call'
    end
  end

  resources :users do
    resources :contacts
  end

  resources :contacts, only: [ :index, :show, :update, :destroy ]

  # TODO: remove this
  get '_inspect' => 'sessions#_inspect'
end
