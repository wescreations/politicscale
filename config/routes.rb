Rails.application.routes.draw do

get 'contact' => 'contact#index'
resources :contact, only: [:index, :new, :create]
  get 'notifications/index'
  get 'pets/index'
  get 'pets/show'
  get 'pets/new'
  get 'pets/create'
  get 'pets/edit'
  get 'pets/delete'
  get 'pets/destroy'
  get 'index/show'
  get 'index/new'
  get 'index/create'
  get 'index/edit'
  get 'index/delete'
  get 'index/destroy'
  get :search, controller: :main


  get 'uploads/new'
  get 'uploads/create'
  get 'uploads/index'
  devise_for :users
  resources :users, only: [:index]

  resources :uploads

   root to: 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, :except => [:show] do
    member do
    get :delete
  end
end

  resources :candidates do
    member do
      put "like" =>  "candidates#vote"
      put "unlike" => "candidates#downvote"
    end
    member do
    get :delete
  end
end

  resources :national_races do
    member do
      put "like" =>  "national_races#vote"
      put "unlike" => "national_races#downvote"
    end
    member do
    get :delete
  end
end

  resources :pets do
    member do
    get :delete
  end
end

  resources :notifications do
    member do
    get :delete
  end
end

  resources :state_races do
    member do
      put "like" =>  "state_races#vote"
      put "unlike" => "state_races#downvote"
    end
    member do
    get :delete
  end
end

  resources :city_races do
    member do
      put "like" =>  "city_races#upvote"
      put "unlike" => "city_races#downvote"
    end
    member do
    get :delete
  end
end

  resources :pages do
    member do
    get :delete
  end
end

end
