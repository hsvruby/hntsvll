Hntsvll::Application.routes.draw do
  resources :accounts do
    collection do
      get :autocomplete
    end
  end

  resource :update, :controller => "update", :only => [:new, :create, :edit, :show]
  resource :confirmation, :only => [:new, :create, :show]

  root :to => 'accounts#index'
end
