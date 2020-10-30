Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions,
      registrations: 'registrations'
     },
                       path_names: { sign_in: :login }
    resource :user, only: [:show, :update]
    post 'password/forgot', to: 'password#forgot'
  	post 'password/reset', to: 'password#reset'

    get 'success', to: 'statics#success'
    get 'error', to: 'statics#error'

    resources :doctors do
      resources :slots
    end

    resources :patients do
      resources :appointments do
        collection do
          get 'get_all_slots'
        end
      end
    end

  end
  get 'change_password', to: 'password#change_password', as: :change_password


end
