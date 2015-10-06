Rails.application.routes.draw do

  resources :labels, only: [:show]

  resources :questions
  resources :advertisements
  resources :topics do
    resources :posts, except: [:index]

  end

   resources :posts, only: [] do
     resources :comments, only: [:create, :destroy]
     resources :favorites, only: [:create, :destroy]

     post "/up-vote" => "votes#up_vote", as: :up_vote
     post "/down_vote" => "votes#down_vote", as: :down_vote
   end
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  post "users/confirm" => "users#confirm"

  get "about" => "welcome#about"

  root to: 'welcome#index'
end
