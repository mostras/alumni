Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: "users/sessions" }

  namespace :admin do
    root "application#index"
    get "statistics", to: 'pages#statistics'
    get "emails", to: 'pages#emails'
  end


  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  get "linkedin", to: "pages#linkedin"
  get "welcome", to: "pages#welcome"

  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :edit_situation
      get :updating_profil_exp
      post :submit_url_linkedin
      post :submit_url_for_update
      patch :set_automatic_updating
      patch :set_manual_updating
    end
  end

  resources :tags, only: [:index, :new, :create, :edit, :destroy] do
    collection do
      get :tag_creation
    end
  end

  resources :user_sectors, only: [:index, :new, :create, :edit, :destroy] do
    collection do
      get :sector_creation
    end
  end

  resources :companies, only: [:index, :show, :new, :create, :edit, :update]

  resources :work_experiences, only: [:new, :create, :edit, :update, :destroy]

  resources :schools, only: [:index, :show, :new, :create, :edit, :update]

  resources :school_experiences, only: [:new, :create, :edit, :update, :destroy]
end
