App::Application.routes.draw do
  devise_for :admins, :skip => :password

  resources :contacts

  root                 :to => 'contacts#new'
  match '/',           :to => 'contacts#new'
  match '/contact_us', :to => 'contacts#new'
  match '/admin'           => redirect('/admins/sign_in')
end
