class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  # ユーザーのページにアクセスする前に、を実行する。

  # 以下のメソッドの公開レベルをprotected で設定する。
  #　public > protected > private  
  protected

  def after_sign_in_path_for(resource)
    user_path(current_user) # ログイン後、マイページ画面に移動する
  end

#  def after_sign_up_path_for(resource)
#    user_path(current_user)
#  end

  def configure_permitted_parameters
  # ログイン画面で使用するユーザー名の設定。
  # 新規登録の時に、ユーザー名も使えるようにする
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

end
