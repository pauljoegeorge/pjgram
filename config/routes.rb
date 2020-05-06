Rails.application.routes.draw do
  get 'articles/new'
  get 'articles/index'
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

  scope :articles do
    get '/'             => 'articles#index',              as: 'articles'
    get '/new'          => 'articles#new',                as: 'new_article'
    post '/'            => 'articles#create',             as: 'article_create'
    delete '/:id'       => 'articles#destroy',            as: 'delete_article'
    get '/:id'          => 'articles#show',               as: 'article'
    get '/edit/:id'     => 'articles#edit',               as: 'edit_article'
    patch '/:id'        => 'articles#update',             as: 'update_article'
  end

  scope :article_comments do
    post '/'  => 'article_comments#create',  as: 'article_comment_create'
  end

  scope :profile do
    get '/'       => 'users#profile',         as: 'user_profile'
    get '/:id'    => 'users#profile',         as: 'user_profile_by_id'
    get '/:id/edit'   => 'users#profile_edit',    as: 'user_profile_edit'
    patch '/updated'  => 'users#profile_update',  as: 'user_profile_update'
  end

  scope :follow do
    post '/'       => 'follows#create',         as: 'follow_user'
  end

  scope :unfollow do
    post '/'       => 'follows#delete',         as: 'unfollow_user'
  end

  scope :tags do
    get '/:tag_name' => 'tags#list', as: 'articles_by_tag'
  end

  scope :daily do
    get '/' => 'daily_notes#show', as: 'daily_notes'
  end
end



