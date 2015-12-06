Rails.application.routes.draw do
  root 'welcome#index'
  resource :session, only: [:create, :destroy]

  resource :user, only: [] do
    resources :compliments, only: [:index], to: 'compliments'
  end

  match "*path" => redirect("/"), via: :get
end
