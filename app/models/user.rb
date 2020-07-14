class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true, length: {minimum: 2, maximum: 20}
  validates :introduction, length: {maximum: 200}
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :rooms, dependent: :destroy
  has_many :room_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
