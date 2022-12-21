Rails.application.routes.draw do
  root  'homes#top'
  resources :homes

  resources :books
  delete 'books' => 'books#destroy_index', as: 'books_delete'
end
