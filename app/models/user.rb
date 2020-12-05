class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true, format: { with: /@.+/ }, uniqueness: true
  validates :password, presence: true, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?[\d])[a-zA-Z\d]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[ー-龥ぁ-ん]/ }
  validates :first_name, presence: true, format: { with: /\A[ー-龥ぁ-ん]/ }
  validates :katakana_last_name, presence: true, format: { with: /\A[ァ-ヶーー]+\z/ }
  validates :katakana_first_name, presence: true, format: { with: /\A[ァ-ヶーー]+\z/ }
  validates :birthday, presence: true

end
