Rails.application.routes.draw do
  root  'homes#top'
  resources :homes

  resources :books
end
