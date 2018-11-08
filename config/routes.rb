#
Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json }, path: '/'  do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      # Authorization routes
      post '/auth_user' => 'authentication#authenticate_user'
      # User routes
      resources :users, only: %i[index show create update destroy]
      get '/admins' => 'users#admins'
      get '/sponsors' => 'users#sponsors'
      post '/sponsor' => 'users#create_sponsor'
      post '/password_recover' => 'users#recover_password'
      # Event routes
      get '/events/upcoming' => 'events#upcoming'
      get '/events/past' => 'events#past'
      resources :events, only: %i[index show create update destroy]
      get '/event_list' => 'events#event_list'
      get '/upcoming_events' => 'events#upcoming_events'
      get 'events/:id/registrees' => 'events#registrees'
      get 'applicant_events/:applicant_id' => 'events#applicant'

      # Registry routes
      resources :registrees, only: %i[index show create destroy]
      # Category routes
      resources :categories, only: %i[index create update destroy]
      get 'category/:id/event_count' => 'categories#event_count'
    end
  end
end
