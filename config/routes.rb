Rails.application.routes.draw do
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'customers/show' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers/update' => 'customers#update'
    get "customers/confirmation" => 'customers#confirmation'
    patch "customers/withdrawal" => 'customers#withdrawal'
    resources :items, only: [:index, :show]
    delete "cart_items/destroy_all" => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :create, :destroy]
    post "orders/confirm" => 'orders#confirm'
    get "orders/complete" => 'orders#complete'
    resources :orders, only: [:new, :create, :index, :show]
  end

  namespace :admin do
     root to: 'homes#top'
     resources :items, only: [:index, :new, :create, :show, :edit, :update]
     resources :customers, only: [:index, :show, :edit, :update]
  end

  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
