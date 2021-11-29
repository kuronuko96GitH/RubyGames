class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ユーザーが削除された時に、それに紐づくゲームスコア情報をも削除する。
  has_many :games, dependent: :destroy

  # 新規登録時、テキストボックスの空白チェック
  # ユーザー名が空白の時にエラーメッセージを出す。
  validates :username, presence: true
end
