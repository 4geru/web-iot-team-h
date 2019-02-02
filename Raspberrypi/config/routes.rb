Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'root#index'
  resources :raspberrypies, only: %i[index]
  resources :logs, only: %i[create index]
  resources :commands, only: %i[index]
  resources :tanbo, only: %i[index]
end
