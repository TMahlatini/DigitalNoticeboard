
Rails.application.routes.draw do
  root "pages#landing" # the landing is the login page

  devise_for :user, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    delete 'users/sign_out', to:'devise/sessions#destroy'
    get 'users/sign_in', to: 'devise/sessions#new'
    get 'users/sign_up', to: 'devise/registrations#new'
    get 'users/password/new', to: 'devise/passwords#new'
    get 'users/password/edit', to: 'devise/passwords#edit'
    get 'users/confirmation', to: 'devise/confirmations#show'
    get 'users/confirmation/new', to: 'devise/confirmations#new'
    get 'users/unlock/new', to: 'devise/unlocks#new'
  end

  #root "noticeboard#index" # notice board is the home page
  authenticate :user do
    get "noticeboard", to: "noticeboard#index", as: :authenticated_root
    get "for_sale", to: "noticeboard#for_sale", as: :for_sale
    get "housing", to: "noticeboard#housing", as: :housing
    get "rides", to: "noticeboard#index", as: :rides
    resources :noticeboard, only: [:index, :new, :create, :show]
    resources :sticker_notes, only: [:new, :create, :show, :destroy]
  
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
