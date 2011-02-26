Hntsvll::Application.routes.draw do
  resources :accounts do
    collection do
      get :autocomplete
    end
  end

  resource :confirmation, :only => [:new, :create, :show]

  root :to => 'accounts#index'
end
