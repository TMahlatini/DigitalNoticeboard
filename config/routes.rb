Rails.application.routes.draw do
  root "pages#landing" # the landing is the login page

  devise_for :users
  devise_scope :user do
    delete 'users/sign_out', to:'devise/sessions#destroy'
  end

  #root "noticeboard#index" # notice board is the home page
  authenticate :user do
    get "noticeboard", to: "noticeboard#index", as: :authenticated_root
    resources :noticeboard, only: [:index, :new, :create, :show]
    resources :sticker_notes, only: [:new, :create, :show]
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
