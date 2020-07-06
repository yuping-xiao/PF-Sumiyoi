class RoomImage < ApplicationRecord

	belongs_to :room
	attachment :image

end
