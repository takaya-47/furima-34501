class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # email (default)必須、一意性、@を含む
  # password (default)必須、６文字以上、確認用と一致
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数字を含めて入力してください'
  with_options presence: true do
    validates :nickname
    NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/
    validates_format_of :last_name, with: NAME_REGEX, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください'
    validates_format_of :first_name, with: NAME_REGEX, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください'
    NAME_KANA_REGEX = /\A[ァ-ヶ]+\z/
    validates_format_of :last_name_kana, with: NAME_KANA_REGEX, message: 'は全角カタカナで入力してください'
    validates_format_of :first_name_kana, with: NAME_KANA_REGEX, message: 'は全角カタカナで入力してください'
    validates :birthday
  end

end
