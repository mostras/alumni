Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'users/registrations' }


  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  get "linkedin", to: "users#linkedin"
  get "submit_url_linkedin", to: "users#submit_url_linkedin"
  get "welcome", to: "users#welcome"

  resources :users, only: [:index, :show, :edit, :update]

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

  resources :companies, only: [:index]
  resources :schools, only: [:index]


end
