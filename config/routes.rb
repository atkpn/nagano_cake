Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: "public/homes#top"
  get '/about' => 'public/homes#about'
  get '/customers/my_page' => 'public/customers#show'
  get '/customers/infomation/edit' => 'public/customers#edit'
  patch '/customers/infomation' => 'public/customers#update'
  get '/customers/current_customer/unsubscribe' => 'public/customers#unsubscribe'

  scope module: :public do
    resources :orders, only: [:new, :index, :show]
  end


  # 管理者用
  # URL /admin/sign_in...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  get '/admin' => 'admin/homes#top'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
