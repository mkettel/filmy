Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # this route should allow the show action to be accessible
  # get '/rolls/:id', to: 'rolls#show'
  # get '/cameras/:camera_id/rolls/:id', to: 'rolls#show' # this was causing it to always route to rolls#show
  get '/account', to: 'pages#account'
  get '/cameras/:camera_id/rolls/new', to: 'rolls#new'
  # delete '/cameras/:camera_id', to: 'cameras#destroy'

  # this should make the upload image a POST to the roll database
  post '/upload_image/:frame_id', to: 'rolls#upload_image'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :cameras do
    resources :rolls do
      resources :frames
    end
  end
end
