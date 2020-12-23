class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates_format_of :encrypted_password, with: PASSWORD_REGEX, message: '英字と数字の両方を含めて設定してください' 

validates :nickname, presence: true
with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
  validates :last_name, presence: true
  validates :first_name, presence: true
end 

with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナを使用してください' } do
  validates :furigana_last_name, presence: true
  validates :furigana_first_name, presence: true
end 

validates :birth_date, presence: true

has_many :items
has_many :Purchase_records
  
end
