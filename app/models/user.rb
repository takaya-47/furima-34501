class User < ApplicationRecord
  has_many :items

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # email (default)必須、一意性、@を含む
  # password (default)必須、６文字以上、確認用と一致
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数字を含めて入力してください'
  with_options presence: true do
    validates :nickname
    NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/
    with_options format: { with: NAME_REGEX, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' } do
      validates :last_name
      validates :first_name
    end
    NAME_KANA_REGEX = /\A[ァ-ヶ]+\z/
    with_options format: { with: NAME_KANA_REGEX, message: 'は全角カタカナで入力してください' } do
      validates :last_name_kana
      validates :first_name_kana
    end
    validates :birthday
  end
end
