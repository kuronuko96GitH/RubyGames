class GamesController < ApplicationController

  # before_action…deviseのヘルパー機能
  before_action :authenticate_user!, except: [:index, :demo]

  #　ゲームスコア情報の新規登録(new)、編集画面(edit)、詳細画面(show)　は他ユーザーからのアクセス不可とする。
  #
  #例）except: [:index]を指定すると…(index)一覧画面のみは、
  #　　ユーザー情報を取得できないゲストユーザーでもアクセスは可能となる。


  def demo
    # ゲスト様用のタイピングゲームへ繋げるHTMLリンクのルートアクション
  end


  def index
    # ゲームスコア一覧画面

    # ゲームコードのクラス変数（newメソッド内のみ変数）
    @@gamecode = 1

    if params["frmgamecode"] != nil
      # マイページからの画面遷移リンクの引数に
      #（params_gamecode）が指定されていた場合。
      @@gamecode = params["frmgamecode"]
    end

    # スコアの高い順（降順）に並び替えてレコードを取得
    @games = Game.where(gamecode: @@gamecode).order(score: :desc)
#    @games = Game.order(score: :desc)

# DBの操作は、app\models\application_record.rbの『ActiveRecord』で実行してます。
# 全てのゲームスコア情報を取得する
#    @games = Game.all
  end


#　今回のプロジェクトでは不要。
#  def show
#    @game = Game.find(params[:id])
#  end


  def new
    # 新規登録画面　の呼び出し

     @@gamecode = 1 # ゲームコードのクラス変数（newメソッド内のみ変数）

     if params[:gamecode] != nil
       # マイページからの画面遷移リンクの引数に
       #（gamecode）が指定されていた場合。
       @@gamecode = params[:gamecode]
     end

     #  空のモデルを取得し、引数のゲームコードを設定しておく。
     @game = Game.new(gamecode: @@gamecode)

  end


  def create
    # ゲームスコアの新規登録処理

    # game.rb　の　validates処理（テキストボックスの空白チェック）
    @game = current_user.games.build(game_params)

    if @game.save
      # ゲームスコアの新規データ追加処理が成功した場合
      # gamesコントローラーのindexアクション（ランキング表）へリダイレクト
      redirect_to controller: :games, action: :index

    else
      #DB更新に失敗した場合
    end
  end


  def edit
    # 編集登録画面を表示
    @game = Game.find(params[:id])
    if @game.user != current_user
        redirect_to games_path, alert: "不正なアクセスです。"
    end
  end


  def update
    # データベースの更新処理
    @game = Game.find(params[:id])
    if @game.update(game_params)
      # ゲームスコアのデータ更新処理が成功した場合
      # gamesコントローラーのindexアクション（ランキング表）へリダイレクト
      redirect_to action: :index

    else
      #DB更新に失敗した場合
    end
  end


  def destroy
    game = Game.find(params[:id])
    game.destroy
    redirect_to user_path(game.user), notice: "ゲームスコアを削除しました。"
  end



  private
  # 以下、プライベート処理のメソッド
  # セキュリティ対策…外部からデータベースにアクセスできないように
  def game_params
   params.require(:game).permit(:gamecode, :score)
  end

end
