Rails.application.routes.draw do
  root 'slides#index'

  resources :slides
  get '/admin' => 'slides#admin'
  post 'slides/publish' => 'slides#publish'
  post 'slides/unpublish' => 'slides#unpublish'


end
