Rails.application.routes.draw do
  #get 'contact_forms/new'

  #get 'contact_forms/create'

 # get 'contact_form/new'

  #get 'contact_form/create'

  root to: "pages#home"

  resources :contact_forms
end
