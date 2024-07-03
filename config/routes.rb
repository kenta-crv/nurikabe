Rails.application.routes.draw do

  #管理者アカウント
  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions'
  }

  resources :admins, only: [:show]

  root to: 'top#index' #Exterior LP
  get '/partner' => 'top#partner' 
  get '/fence' => 'top#fence' #Fence LP
  get '/paint' => 'top#paint' #Paint LP

  resources :columns

  resources :contracts do
    resource :progresses
    collection do
      post :confirm
      post :thanks
    end
    member do
      post :send_mail
      post :send_mail_start #開始日の送信
      get "info" #案内
      get "conclusion"
      get "payment" 
      get "start"
    end
  end

  resources :estimates do
    resource :comments
    collection do
      post :confirm
      post :thanks
    end
    member do
      get :apply
      post :send_mail
      get :confirm_point
      post :apply
    end
  end

  # メッセージ
  resources :messages, only: [:create] do
    collection do
      # メッセージルーム
      get :room, path: '/room/:uri_token'
    end
  end

  #企業側アカウント
  resources :companies do
    collection do
      get :pay
      post :get_point
      post :confirm
      post :thanks
    end
  end

  #get '*path', controller: 'application', action: 'render_404'
end
