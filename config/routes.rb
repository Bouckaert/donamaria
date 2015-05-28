Rails.application.routes.draw do
  root to: "welcome#index"

  resources :representatives
  resources :candidates, controller: 'representatives', type: 'Candidate'
  resources :ambassadors, controller: 'representatives', type: 'Ambassador'

  resources :proposals do
    resources :comments
    resources :promissories do
      collection { get :preview }
    end
    member do
      put "like", to: "proposals#upvote"
      put "dislike", to: "proposals#downvote"
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
end
