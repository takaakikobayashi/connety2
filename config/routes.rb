Rails.application.routes.draw do

  get 'contacts/new'
  get 'contacts/create'
  root 'home#top'
  get  "home/about"  => "home#about"
  get  "home/requesters"  => "home#requesters"
  get  "home/companies"  => "home#companies"
  get "requesters/about"  => "requesters/about#show"
  get "companies/about"  => "companies/about#show"
  get "home/terms" => "home#terms"
  get "home/specified_commercial_transactions" => "home#specified_commercial_transactions"
  get "home/privacy_policy" => "home#privacy_policy"
  get "home/contact" => "home#contact"
  get "home/operations" => "home#operations"
  get "home/offers" => "home#offers"
  get "home/orders" => "home#orders"
  get "home/suspension" => "home#suspension"
  devise_for :admins, controllers:{
    sessions: "admins/sessions",
    passwords: "admins/passwords",
    registrations: "users/registrations"
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
  	get '/', to: "home#top"
    get 'news/new' => 'news#new'
    get 'news/create' => 'news#create'
    get 'categories/new' => 'categories#new'
    post 'categories/create' => 'categories#create'
    get 'categories/index' => 'categories#index'
    get 'categories/:id/edit' => 'categories#edit', as: "categories_edit"
    patch 'categories/:id/update' => 'categories#update'
    delete 'categories/:id/delete' => 'categories#destroy'
    get 'mypage' => 'admins#index'
    resources :companies, only:[:index]
    resources :requesters, only:[:index]
    resources :rooms, only:[:index, :show]
    resources :orders, only:[:index, :show]
    resources :offers, only:[:index, :show]
    resources :users, only:[:index, :show]
    patch "users/:id"  => "users#delete", as: "delete_user"
    patch "requesters/:id"  => "requesters#delete", as: "delete_requester"
    patch "companies/:id"  => "companies#delete", as: "delete_company"
    resources :scholastic_records, only:[:index]
  end
  get "companies/:company_id/rooms/:id"  => "companies/rooms#show", as: "company_show_rooms"
  post "companies/:company_id/rooms/:id"  => "companies/rooms#create", as: "company_create_rooms"
  get "companies/:id/delete"  => "companies#delete", as: "delete_company"
  resources :companies, only:[:index, :show, :edit, :update, :destroy] do
    get "notifications"  => "companies/notifications#index", as: "index_notifications"
    get "offer/:offer_id/offer_applications"  => "companies/offer_applications#index", as: "offer_applications"
    post "offer/:offer_id/offer_applications/new"  => "companies/offer_applications#create", as: "create_offer_applications"
    get "offer/:offer_id/offer_applications/:id"  => "companies/offer_applications#show", as: "show_offer_applications"
    delete "offer/:offer_id/offer_applications/:id"  => "companies/offer_applications#destroy", as: "destroy_offer_applications"
    patch "offer/:offer_id/offer_applications/:id/asset"  => "companies/offer_applications#asset", as: "asset_offer_applications"
    patch "offer/:offer_id/offer_applications/:id/refuse"  => "companies/offer_applications#refuse", as: "refuse_offer_applications"
    patch "offer/:offer_id/offer_applications/:id/adoption"  => "companies/offer_applications#adoption", as: "adoption_offer_applications"
    patch "offer/:offer_id/offer_applications/:id/not_adoption"  => "companies/offer_applications#not_adoption", as: "not_adoption_offer_applications"
    get "offers"  => "companies/offers#index", as: "offers"
    get "offers/new"  => "companies/offers#new", as: "new_offers"
    post "offers/new"  => "companies/offers#create", as: "create_offers"
    get "offers/:id"  => "companies/offers#show", as: "show_offers"
    get "offers/:id/edit"  => "companies/offers#edit", as: "edit_offers"
    patch "offers/:id/edit"  => "companies/offers#update", as: "update_offers"
    patch "offers/:id/delete"  => "companies/offers#delete", as: "delete_offers"
    patch "offers/:id/release"  => "companies/offers#release", as: "release_offers"
    delete "offers/:id"  => "companies/offers#destroy", as: "destroy_offers"
    get "users/:user_id/reviews"  => "companies/reviews#index", as: "company_reviews"
  	get "users/:user_id/problem_solutions"  => "companies/problem_solutions#index", as: "company_problem_solutions"
    get "users/strengths"  => "companies/strengths#index", as: "company_strengths"
    get "users/:user_id/strengths"  => "companies/strengths#show", as: "company_strength"
    get "messages"  => "companies/messages#index", as: "company_message"
  end
  get "requesters/:requester_id/rooms/:id"  => "requesters/rooms#show", as: "requester_show_rooms"
  post "requesters/:requester_id/rooms/:id"  => "requesters/rooms#create", as: "requester_create_rooms"
  get "requesters/:id/delete"  => "requesters#delete", as: "delete_requester"
  resources :requesters, only:[:index, :show, :edit, :update, :destroy] do
  	resources :orders, only:[:destroy]
    get "notifications"  => "requesters/notifications#index", as: "index_notifications"
    get "orders"  => "requesters/orders#index", as: "index_orders"
    get "users/:user_id/orders/new"  => "requesters/orders#new", as: "new_orders"
    post "users/:user_id/orders/new"  => "requesters/orders#create", as: "create_orders"
    patch "orders/:id/complete"  => "requesters/orders#complete", as: "complete_orders"
    get "orders/:id/show"  => "requesters/orders#show", as: "show_orders"
    patch "orders/:id/delete"  => "requesters/orders#delete", as: "delete_orders"
    get "users/:user_id/reviews"  => "requesters/reviews#index", as: "requester_reviews"
    get "users/:user_id/problem_solutions"  => "requesters/problem_solutions#index", as: "requester_problem_solutions"
    get "users/strengths"  => "requesters/strengths#index", as: "requester_strengths"
    get "users/:user_id/strengths"  => "requesters/strengths#show", as: "requester_strength"
    get "messages"  => "requesters/messages#index", as: "requester_message"
  end
  patch "users/:id/edit" => "users#update"
  get "users/:id/delete"  => "users#delete", as: "delete_user"
  resources :users, only:[:index, :show, :edit, :destroy] do
    resources :scholastic_records, only:[:index, :new, :show] do
      resources :comments, only:[:create, :destroy]
      resources :likes, only:[:create]
      delete "likes" => "likes#destroy"
    end
    post "scholastic_records/new" => "scholastic_records#create"
    resources :tasks, only:[:index, :create, :edit, :destroy]
    get "tasks/show" => "tasks#show"
    patch "tasks/:id/edit" => "tasks#update"
    patch "tasks/:id/complete" => "tasks#complete", as: "complete_task"
    patch "tasks/:id/return" => "tasks#return", as: "return_task"
    resources :reviews, only:[:index, :new]
    post "reviews/new" => "reviews#create"
    resources :setting_goals, only:[:new, :edit]
    get "setting_goals/show" => "setting_goals#show"
    post "setting_goals/new" => "setting_goals#create"
    patch "setting_goals/:id/edit" => "setting_goals#update"
    resources :problem_solutions, only:[:index, :new]
    post "problem_solutions/new" => "problem_solutions#create"
    resources :strengths, only:[:new, :edit]
    get "strengths/show" => "strengths#show"
    post "strengths/new" => "strengths#create"
    patch "strengths/:id/edit" => "strengths#update"
    patch "strengths/:id" => "strengths#destroy", as: "destroy_strengths"
    patch "strength/:id" => "strengths#release", as: "release_strengths"
    resources :orders, only:[:index, :show]
    patch "orders/:id/asset" => "orders#asset", as: "asset_orders"
    patch "orders/:id/refuse" => "orders#refuse", as: "refuse_orders"
    patch "orders/:id/cansel" => "orders#cansel", as: "cansel_orders"
    resources :offers, only:[:index, :destroy]
    get "companies/:company_id/offers/:id"  => "offers#show", as: "show_offers"
    post "companies/:company_id/offers/:id"  => "offers#create", as: "create_offers"
    get "offer_applications/index"  => "offer_applications#index", as: "index_offer_applications"
    get "offer_applications/pass"  => "offer_applications#pass", as: "pass_offer_applications"
    get "companies/:company_id/offer_applications/:id"  => "offer_applications#show", as: "show_offer_applications"
    resources :notifications, only:[:index]
    resources :rooms, only:[:show, :create]
    resources :company_rooms, only:[:show, :create]
  end
  
  resources :messages, only:[:index, :create]
  resources :news, only:[:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
