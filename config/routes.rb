Rails.application.routes.draw do

  resources :doses, only: [ :destroy]
  resources :cocktails, only: [ :index, :new, :create, :show, :edit] do
    resources :doses, only: [ :new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
