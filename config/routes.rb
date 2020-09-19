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

  resources :users, only: [:index, :show, :edit, :update] do
    resources :tags, only: [:new, :create, :edit]

    resources :user_sectors, only: [:new, :create, :edit]
  end



end
