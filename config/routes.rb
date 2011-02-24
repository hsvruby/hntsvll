Hntsvll::Application.routes.draw do
  resources :accounts

  resource :confirmation, :only => [:new, :create, :show]

  root :to => 'accounts#index'
end
