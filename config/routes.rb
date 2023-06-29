# require_relative '../app/api/music/base'
# require_relative '../app/api/v1/music/students'

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  mount MusicStore::Base => '/'
end


