# ポートフォリオ（portfolio）
* プロジェクト：RubyGames
* 製作期間：１カ月
* Web上でタイピングゲームなどを遊ぶことができ、
* スコアをランキング表に登録できます。

# 本番環境（Heroku）
* 公開URL：https://kuronuko9646rubygames.herokuapp.com

　※実際に動作するゲームが遊べます。

# システムエンジニア経歴
◆全てWindowsでの開発です。
* Delphi　1年～3年
* VisualBasic　5年以上
* VBA　1年～3年
* Visual Basic .NET　1年～3年
* Java　5年以上
* JavaScript　3年～5年
* JSP　3年～5年
* XML　3年～5年

◆DB・SQL
* Oracle　5年以上
* SQLServer　1年～3年
* Access　1年～3年

# 開発環境
◆開発言語・環境
* ruby (3.0.2)
* rails (6.1.4、フレームワーク)
* JavaScript
* sqlite3 (ローカル環境データベース)
* PostgreSQL (本番環境データベース)
* GitHub (ソースコード管理)
* SourceTree (ソースコード管理)
* Visual Studio Code (ソースコードエディタ)

◆インストールしたgem
* bulma-rails (0.9.2)
* devise (4.8.0)

# 開発者向け
◆使用してるＤＢテーブル
* USERS（ユーザー情報）
* GAMES（スコア情報）

◆ＤＢテーブルの更新タイミング

①新規登録をしないと、

　ランキング表には反映されません。

②新規登録をしたタイミングで、

　USERS（テーブル）にデータを作成します。

③スコア更新をしたタイミングで

　GAMES（テーブル）にデータを作成します。

④GAMES（テーブル）の『gamecode』で

　各ゲームのスコア情報のフラグ管理をしてます。
