class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, length: { minimum: 6 }
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, length: { minimum: 6 }, format:{with: VALID_PASSWORD_REGEX}
  validates :first_name, presence: true
  validates :last_name, presence: true
  KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/
  validates :first_name_kana, presence: true,format:{with: KATAKANA_REGEXP}
  validates :last_name_kana, presence: true,format:{with: KATAKANA_REGEXP}
  validates :birth_day, presence: true

end
