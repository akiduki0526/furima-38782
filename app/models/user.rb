class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format:{with: VALID_PASSWORD_REGEX}
  ZENKAKU_REGEXP =  /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :first_name, presence: true,format:{with: ZENKAKU_REGEXP}
  validates :last_name, presence: true,format:{with: ZENKAKU_REGEXP}
  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/
  validates :first_name_kana, presence: true,format:{with: KATAKANA_REGEXP}
  validates :last_name_kana, presence: true,format:{with: KATAKANA_REGEXP}
  validates :birth_day, presence: true

end
