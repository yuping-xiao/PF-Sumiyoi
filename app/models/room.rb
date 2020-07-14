class Room < ApplicationRecord

	validates :name, presence: true, length: {maximum: 100}
	validates :address, presence: true, length: {minimum: 3, maximum: 200}
	validates :condition, length: { maximum: 1000 }

	has_many :room_comments, dependent: :destroy
	has_many :room_images, dependent: :destroy
	accepts_attachments_for :room_images, attachment: :image
	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	def Room.search(search)
		Room.where(['address LIKE ?', "%#{search}%"])
	end

	belongs_to :user

	enum living_status:{
		_1年未満: 0,
		_1年以上_3年未満: 1,
		_3年以上_5年未満: 2,
		_5年以上: 3
	}
end
