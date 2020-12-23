Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resource :items, :edit, :index, :new, :show, :edit, :update, :destroyd
end
