Rails.application.routes.draw do
  root 'students#index'
  resources :students do
    member do
      get :edit_email
      patch :update_email
    end
  end
end
