Rails.application.routes.draw do

  root 'home#top'
  get  "home/about"  => "home#about"
  get  "home/requesters"  => "home#requesters"
  get  "home/companies"  => "home#companies"
  get "requesters/about"  => "requesters/about#show"
  get "companies/about"  => "companies/about#show"
  devise_for :admins, controllers:{
    sessions: "admins/sessions",
    passwords: "admins/passwords",
  }
  devise_for :users, controllers:{
    sessions: "users/sessions",
    passwords: "users/passwords",
    registrations: "users/registrations"
  }
  devise_for :requesters, controllers:{
    sessions: "requesters/sessions",
    passwords: "requesters/passwords",
    registrations: "requesters/registrations"
  }
  devise_for :companies, controllers:{
    sessions: "companies/sessions",
    passwords: "companies/passwords",
    registrations: "companies/registrations"
  }
  namespace :admins do
  	get '/', to: "admins/home#top"
    resources :companies, only:[:index]
    resources :rooms, only:[:index, :show]
    resources :orders, only:[:index, :show]
    resources :users, only:[:index, :show]
  end
  resources :companies, only:[:show, :edit, :update] do
  	resources :notifications, only:[:index]
    get "offer_applications"  => "companies/offer_applications#index", as: "offer_applications"
    post "offer_applications/new"  => "companies/offer_applications#create", as: "create_offer_applications"
    get "offer_applications/:id"  => "companies/offer_applications#show", as: "show_offer_applications"
    delete "offer_applications/:id"  => "companies/offer_applications#destroy", as: "destroy_offer_applications"
    get "offers"  => "companies/offers#index", as: "offers"
    get "offers/new"  => "companies/offers#new", as: "new_offers"
    post "offers/new"  => "companies/offers#create", as: "create_offers"
    get "offers/:id"  => "companies/offers#show", as: "show_offers"
    get "offers/:id/edit"  => "companies/offers#edit", as: "edit_offers"
    patch "offers/:id/edit"  => "companies/offers#update", as: "update_offers"
    patch "offers/:id"  => "companies/offers#delete", as: "delete_offers"
  	resources :reviews, only:[:index]
  	resources :problem_solutions, only:[:index]
    get "strengths"  => "companies/strengths#index"
    get "strengths"  => "companies/strengths#show"
  end
  resources :requesters, only:[:show, :edit, :update] do
  	resources :notifications, only:[:index]
  	resources :orders, only:[:index, :new, :create, :destroy]
    patch "orders/:id/complete"  => "requesters/orders#complete", as: "complete_orders"
    patch "orders/:id/delete"  => "requesters/orders#delete", as: "delete_orders"
    get "users/reviews"  => "requesters/reviews#index", as: "requester_reviews"
    get "users/problem_solutions"  => "requesters/problem_solutions#index", as: "requester_problem_solutions"
    get "users/strengths"  => "requesters/strengths#index", as: "requester_strengths"
    get "users/:user_id/strengths"  => "requesters/strengths#show", as: "requester_strength"
  end
  get "users/:id/delete"  => "users#delete", as: "delete_user"
  resources :users, only:[:index, :show, :edit, :update, :destroy] do
    resources :scholastic_records, only:[:index, :new, :show] do
      resources :comments, only:[:create, :destroy]
      resources :likes, only:[:create]
      delete "likes" => "likes#destroy"
    end
    post "scholastic_records/new" => "scholastic_records#create"
    resources :tasks, only:[:index, :create, :edit, :destroy]
    patch "tasks/:id/edit" => "tasks#update"
    patch "tasks/:id/complete" => "tasks#complete", as: "complete_task"
    resources :reviews, only:[:index, :new]
    post "reviews/new" => "reviews#create"
    resources :setting_goals, only:[:new, :show, :edit]
    post "setting_goals/new" => "setting_goals#create"
    patch "setting_goals/:id/edit" => "setting_goals#update"
    resources :problem_solutions, only:[:index, :new]
    post "problem_solutions/new" => "problem_solutions#create"
    resources :strengths, only:[:new, :edit, :show]
    post "strengths/new" => "strengths#create"
    patch "strengths/:id/edit" => "strengths#update"
    patch "strengths/:id" => "strengths#destroy", as: "destroy_strengths"
    patch "strength/:id" => "strengths#release", as: "release_strengths"
    resources :orders, only:[:index, :show, :create, :destroy]
    resources :offers, only:[:index, :show, :create, :destroy]
    resources :notifications, only:[:index]
  end
  
  resources :rooms, only:[:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
