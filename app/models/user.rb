class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         has_many :puchases
         has_many :items

         #with_options presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'メールアドレスは@を含む必要があります' } do
         #validates :email, presence: true, format: { with: /\w+@\w+\.{1}[a-zA-Z]{2,}/, message: 'メールアドレスは@を含む必要があります' } do
         validates :nickname, presence: true
         validates :email, confirmation: true
         validates :password, presence: true
        

         with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角（漢字・ひらがな・カタカナ）文字を使用してください' } do
         validates :family_name, presence: true
         validates :first_name, presence: true
         end

         with_options presence: true, format: { with: /\A[ァ-ン一-龥]+\z/, message: '全角（カタカナ）文字を使用してください' } do
         validates :family_name_kana, presence: true
         validates :first_name_kana, presence: true
         end

         validates :birthday, presence: true
         
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
        validates_format_of :password, { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }
end
