Rails.application.routes.draw do
  root "todo#index"

  resources :todo_lists do
    resources :todo_items do
      member do
        patch :complete
      end
    end
  end
end
