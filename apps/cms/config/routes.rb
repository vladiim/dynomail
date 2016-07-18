post '/contents', to: 'contents#create'
get '/', to: 'contents#index'
resources :contents
