Rails.application.routes.draw do
  get 'parts/create'

  get 'parts/delete'

  get 'parts/show'

  get 'employees/new'
  resources :employees
  resources :parts
  resources :customers
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'static_pages#home'
  match '/help',    to: 'static_pages#help' , via: 'get'
  match '/about',   to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/signup',  to: 'employees#new', via: 'get'
  match '/signin',  to: 'sessions#new', via: 'get'         
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/create',  to: 'parts#create', via: 'get'
  match '/show',    to: 'parts#show', via: 'get'
  match '/delete',  to: 'parts#delete', via: 'get'



end
