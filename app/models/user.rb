class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # email (default)必須、一意性、@を含む
  # password (default)必須、６文字以上、確認用と一致
  validates :nickname, presence: true
  validates :encrypted_password, format: { with: /[a-z\d]{8}/i, message: "は半角英数字で入力してください" }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: "は全角カタカナで入力してください" }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: "は全角カタカナで入力してください" }
  validates :birthday, presence: true

end
