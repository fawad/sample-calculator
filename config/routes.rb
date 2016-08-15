Rails.application.routes.draw do
  resources :calculations
  
  root 'calculations#new'
end
