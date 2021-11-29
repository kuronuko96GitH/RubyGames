class Game < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    # 新規登録時、テキストボックスの空白チェック
    validates :score
  end
end
