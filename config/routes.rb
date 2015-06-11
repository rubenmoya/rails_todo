Rails.application.routes.draw do
  root "todo#index"

  resources :todo_lists do
    resources :todo_items
  end
end
