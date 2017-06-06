Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json }, constraints: {subdomain: 'api'}, path: "/" do
    
  end

  #Controlers de um admin, contruir pasta no controllers, admin
  # namespace :admin do
  # end

  #api.localhost:3000

end
