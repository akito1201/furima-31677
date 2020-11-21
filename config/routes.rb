Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  get 'items/:item_id/favorites', to: 'favorites#check'
  get '/:user_id/favorites', to: 'favorites#index'
  get '/:user_id/items', to: 'items#owner'


  resources :items do
    collection do
      get 'search'
    end
    resources :records, only: [:index, :create]

  end
end
