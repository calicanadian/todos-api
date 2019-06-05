Rails.application.routes.draw do

  # namespace the controllers withoout affectign the URI
  scope module: :v2, constraints: ApiVersion.new('v2') do
    resources :todos, only: :index
    post 'auth/login', to: 'authentication#authenticate'
    post 'signup', to: 'users#create'
  end
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    post 'auth/login', to: 'authentication#authenticate'
    post 'signup', to: 'users#create'
    resources :todos do
      resources :items
    end
  end



end
