class UsersController < ApplicationController

  # before_action…deviseのヘルパー機能
  #
  #　 [:index]を指定すると…(index)一覧画面のみは、
  #ユーザー情報を取得できないゲストユーザーの閲覧は可能とする。
  #　それ以外のゲームスコア情報の新規登録、詳細画面、編集画面　はアクセス不可とする。
  before_action :authenticate_user!, except: [:index, :aboutme, :link]

  def aboutme
    # About me用のルートアクション
  end

#　今回のプロジェクトでは不要。
#  def index
#  # ユーザーの一覧画面
#    @users = User.all # 一覧画面で、全てのユーザー情報を取得する
#  end

  def show
  # ユーザーの詳細画面
  # 詳細画面で、１人のユーザー情報を取得する

  # params[:id] は　一覧画面などのURLリンク指定先にある『users/1』の
  #『1』情報を取得して、詳細画面に渡している。
    @user = User.find(params[:id])
  end

  def edit
    # ユーザーの編集画面
    @user = User.find(params[:id]) # 編集画面で、１人のユーザー情報を取得する
    if @user != current_user
        redirect_to user_path(current_user), alert: "不正なアクセスです。"
    end
  end

  def update
    # ユーザーの更新処理
    @user = User.find(params[:id]) # 更新対象のユーザー情報を取得する
    if @user.update(user_params)
      # 更新処理(user_paramsメソッドを呼び出す)

      # update完了後にユーザー詳細画面に戻る。
      redirect_to user_path(@user), notice: "ユーザー情報を更新しました。"
    else
      render :edit
    end
  end



  private
  # 以下、プライベート処理のメソッド
  # セキュリティ対策…外部からデータベースにアクセスできないように
  def user_params
   params.require(:user).permit(:username, :email)
  end

end
