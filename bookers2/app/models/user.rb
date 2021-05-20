class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :email, presence: true
  validates :password, presence: true
  validates :name, length: {minimum: 2}
  validates :introduction, length: { maximum: 50 }


  has_many :books, dependent: :destroy

  attachment :profile_image

end
