Props::Application.routes.draw do
   get 'app' => 'authenticated#main_app'
end
