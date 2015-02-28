Rails.application.routes.draw do

  devise_for :users

  resources :representatives
  resources :candidates, controller: 'representatives', type: 'Candidate'
  resources :ambassadors, controller: 'representatives', type: 'Ambassador'

  resources :proposals do
    resources :comments
    member do
      put "like", to: "proposals#upvote"
      put "dislike", to: "proposals#downvote"
    end
  end

  resources :candidatures   do
    collection { get :import }
  end

  resources :revenues do
   collection { get :import }
  end

  resources :expenditures do
    collection { get :import }
  end

  resources :patrimonies do
   collection { get :import }
  end

  root to: "welcome#index"

end
