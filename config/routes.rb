Rails.application.routes.draw do
  get 'account/signup'
  get 'account/signin'
  get 'account/signout'
  devise_for :users, :controllers => {:registrations => "account"}
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
    get 'signin', to: 'devise/sessions#new'
    get 'signout', to: 'devise/sessions#destroy', as: :signout
  end
  get 'landing_pages/home'
  get 'landing_page/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  root to: "landing_pages#landing_page"

  scope :dictionary do
    get '/'             => 'vocabularies#index',          as: 'vocabularies'
    post '/'            => 'vocabularies#create'
    delete '/:id'       => 'vocabularies#destroy',        as: 'delete_vocabulary'
    get '/search'      => 'vocabularies#search_by_word', as: 'search_word'
    get '/:id'          => 'vocabularies#show',           as: 'show_word'
    get '/edit/:id'     => 'vocabularies#edit',           as: 'edit_vocabulary'
    patch '/:id'        => 'vocabularies#update',         as: 'update_vocabulary'
  end
end



