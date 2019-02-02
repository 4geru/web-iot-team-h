Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :raspberrypies, only: %i[index]
  resources :logs, only: %i[create]
  resources :commands, only: %i[index]
end
