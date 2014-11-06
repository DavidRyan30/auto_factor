Rails.application.routes.draw do
  get 'employees/new'

  root to: 'static_pages#home'
  match '/help',    to: 'static_pages#help' , via: 'get'
  match '/about',   to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/signin',  to: 'sessions#new', via: 'get' 
  match '/signup',  to: 'employees#new', via: 'get'
  match '/signout', to: 'sessions#destroy', via: :delete 

end
