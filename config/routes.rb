Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :songs, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  delete '/songs/:id', to: 'songs#destroy'
  patch'/songs/:id', to: 'songs#update'
 
end
