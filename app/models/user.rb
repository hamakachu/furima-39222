class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  validates :nickname, presence: true
  validates :family_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
  validates :family_kana, presence: true, format: {with: /\A[ァ-ヴー]+\z/}
  validates :first_kana, presence: true, format: {with: /\A[ァ-ヴー]+\z/}
  validates :birth, presence: true
end
