Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'users/registrations' }


  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  resources :users, only: [:index, :show, :edit, :update] do
    resources :tags, only: [:edit, :create]

    resources :user_sectors, only: [:edit, :create]
  end



end
