Rails.application.routes.draw do
  root to: 'web#home'
  get 'web/home' => redirect('/')

  get 'web/about_us'

  # Especificar una ruta y el controlador que la atendera. as: sera la porcion URL al recurso
  # get 'web/about_us' => 'web#about_us', as: 'web_about_us'
  get 'web/search'

  resources :books, except: [:new, :create]
  # anidado de rutas y recursos
  resources :authors do
    resources :books
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
