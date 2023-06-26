Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show] # Pour afficher le profil d'un utilisateur
  resources :cars, only: %i[index show] do
    resources :bookings, only: [:create] # Pour créer une réservation à partir d'une voiture spécifique
  end
  resources :bookings, only: [:index] # Pour afficher toutes les réservations d'un utilisateur
  namespace :owner do
    get 'bookings/index'
    resources :cars, only: %i[index new create]
    resources :bookings, only: [:index] do # Pour afficher toutes les réservations d'un propriétaire
      member do
        patch :accept
        patch :decline
        patch :cancel
      end
    end
    resources :cars, except: [:show] # Pour créer, modifier et supprimer une voiture à partir du tableau de bord du propriétaire
  end
end
