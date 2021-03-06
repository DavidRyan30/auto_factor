Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'customers/new'
  get 'customers/create'

  get 'parts/create'
  get 'parts/show'

  # get 'employees/new'
  
  resources :invoices
  resources :employees
  resources :parts
  resources :customers
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'static_pages#home'
  match '/help',    to: 'static_pages#help' , via: 'get'
  match '/about',   to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/welcome', to: 'static_pages#welcome', via: 'get'
  match '/signup',  to: 'employees#new', via: 'get'
  match '/signin',  to: 'sessions#new', via: 'get'         
  match '/signout', to: 'sessions#destroy', via: :delete
  match '/show_parts_menu',    to: 'parts#show', via: 'get'
  match '/delete',  to: 'parts#delete', via: 'get'
  match '/showparts', to: 'parts#showparts', via: 'get'
  match '/findmodel/:id', to: 'parts#findmodel', via: 'post'
  match '/customers/create', to: 'customers#create', via: 'post'
  match '/invoices/new', to: 'invoices#new', via: 'post'
  match '/invoices/create', to: 'invoices#create', via: 'post'
  match '/invoices/:id/download_pdf', to: 'invoices#download_pdf', via: :get, as: :download_pdf
end

