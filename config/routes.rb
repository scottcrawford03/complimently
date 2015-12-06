Rails.application.routes.draw do
  root 'welcome#index'
  resource :session, only: [:create, :destroy]
  match "*path" => redirect("/"), via: :get
end
