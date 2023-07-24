Rails.application.routes.draw do

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'customers/show' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers/update' => 'customers#update'
  end

  namespace :admin do
     root to: 'homes#top'
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
