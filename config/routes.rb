Rails.application.routes.draw do
  root "prototypes#index"
  devise_for :users
end
