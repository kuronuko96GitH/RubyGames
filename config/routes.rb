Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"

#  get 'home/index'



  resources :users  # 各ページへの（ルーティング）getがこの一文で作成される。

#  get 'users/index' # 今回のプロジェクトは不要
#  get 'users/show'
#  get 'users/new'
#  get 'users/edit'

get  '/aboutme',    to: 'users#aboutme' #About me



  resources :games  # （index,show,new,edit）

#  get 'games/index'
#  get 'games/show'  # 今回のプロジェクトは不要
#  get 'games/new'
#  get 'games/edit'

  get  '/demo',    to: 'games#demo' #ゲストページ
#  get 'games/demo'

end
