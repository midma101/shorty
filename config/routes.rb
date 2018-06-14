Rails.application.routes.draw do
  resources :shorty, only: [:index, :show, :create] do
    member do
      get :short
    end
  end

  get '/:shorty_path', to: 'shorty#short', shorty_path: /[A-Za-z0-9]{8}/
  get '/', to: redirect('/shorty')
end
