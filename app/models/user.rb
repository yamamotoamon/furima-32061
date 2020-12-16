class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items, foreign_key: :user_id, dependent: :destroy
  has_many :buys, foreign_key: :user_id, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :email, format: { with: /@.+/ }, uniqueness: { case_sensitive: true }
    validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?[\d])[a-zA-Z\d]+\z/ }
    validates :last_name, format: { with: /\A[ー-龥ぁ-ん]/ }
    validates :first_name, format: { with: /\A[ー-龥ぁ-ん]/ }
    validates :katakana_last_name, format: { with: /\A[ァ-ヶーー]+\z/ }
    validates :katakana_first_name, format: { with: /\A[ァ-ヶーー]+\z/ }
    validates :birthday
  end

end
