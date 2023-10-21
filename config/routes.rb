Rails.application.routes.draw do
  get 'weather_page/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  

  get 'weather_page/get_weather', to: 'weather_page#get_weather'
  root :to => 'weather_page#index'  #RAILS 3
  # Defines the root path route ("/")
  # root "posts#index"
end
