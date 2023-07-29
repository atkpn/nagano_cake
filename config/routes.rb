Rails.application.routes.draw do
  namespace :admin do
    get 'orders/show'
  end
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
  get '/customers/current_customer/unsubscribe' => 'public/customers#unsubscribe', as: 'unsubscribe'
  patch '/customers/withdraw' => 'public/customers#withdraw', as: 'withdraw'

  scope module: :public do
    resources :items, only: [:index, :show]
    resources :orders, only: [:new, :index, :show, :create] do
      collection do
        get 'thanks'
        post 'confirm'
      end
    end
    # get '/orders/thanks' => 'orders#thanks'
    # post '/orders/confirm' => 'orders#confirm'
    resources :cart_items, only: [:index, :update, :destroy, :create]
  end

  get '/cart_items/destroy_all' => 'public/cart_items#destroy_all', as: 'destroy_all'


  # 管理者用
  # URL /admin/sign_in...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  get '/admin' => 'admin/homes#top'

  namespace :admin do
    resources :items, except:[:destroy]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
