class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :email, presence: true
  validates :password, presence: true
  validates :name, length: {minimum: 2}
  
  has_many :books, dependent: :destroy

end
