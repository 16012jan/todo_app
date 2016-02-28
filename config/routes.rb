Rails.application.routes.draw do

  devise_for :users
  root to: 'todo_lists#index'

  resources :todo_lists do
    resources :items
  end

  post "todo_lists/:id/items/add_item" => 'todo_lists#add_item'

end
