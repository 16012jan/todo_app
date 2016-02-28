Rails.application.routes.draw do

  root to: 'todo_lists#index'

  resources :todo_lists, as: :todo do
    resources :items
  end

end
