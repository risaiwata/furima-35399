class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

          with_options presence: true do
            validates :nickname
            validates :birthdate
            with_options format: { with:/\A[ぁ-んァ-ン一-龥々ー]+\z/} do
              validates :first_name
              validates :last_name
            end
            with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
              validates :first_name_ruby
              validates :last_name_ruby
            end
            VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
            validates :password, format: {with: VALID_PASSWORD_REGEX, message: "は英数字混合にしてください"}
          end
          has_many :products
          has_many :purchasers
end
