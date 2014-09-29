Rails.application.routes.draw do

  root to: "pages#home"

  match '/contacts',     to: 'contacts#new',             via: 'get'
resources "contacts", only: [:new, :create]
end
