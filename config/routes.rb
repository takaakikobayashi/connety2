Rails.application.routes.draw do

  root 'home#top'
  get  "home/about"  => "home#about"
  get  "home/requesters"  => "home#requesters"
  get  "home/companies"  => "home#companies"
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
  	resources :offer_applications, only:[:index, :show, :create, :destroy]
  	resources :offers, except:[:destroy]
  	resources :reviews, only:[:index]
  	resources :problem_solutions, only:[:index]
  	resources :strengths, only:[:index, :show]
  	resources :about, only:[:show]
  end
  resources :requesters, only:[:show, :edit, :update] do
  	resources :notifications, only:[:index]
  	resources :orders, only:[:index, :new, :create, :destroy]
  	resources :reviews, only:[:index]
  	resources :problem_solutions, only:[:index]
  	resources :strengths, only:[:index, :show]
  	resources :about, only:[:show]
  end
  resources :users, only:[:index, :show, :edit, :update, :destroy] do
    resources :scholastic_records, only:[:index, :create]
    resources :tasks, except:[:show, :new]
    resources :reviews, only:[:index, :create, :new]
    resources :setting_goals, only:[:new, :show, :create, :update]
    resources :problem_solutions, only:[:index, :create]
    resources :strengths, only:[:show, :create, :update, :destroy]
    resources :orders, only:[:index, :show, :create, :destroy]
    resources :offers, only:[:index, :show, :create, :destroy]
    resources :notifications, only:[:index]
    resources :comments, only:[:index, :create, :destroy]
    resources :likes, only:[:create, :destroy]
  end
  get  "users/:id/delete"  => "users#delete", as: "delete_user"
  resources :rooms, only:[:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
