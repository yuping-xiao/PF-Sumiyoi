class FavoritesController < ApplicationController

	def create
		room = Room.find(params[:room_id])
		favorite = current_user.favorites.new(room_id: room.id)
		favorite.save
		redirect_to room_path(room)
	end

	def destroy
		room = Room.find(params[:room_id])
		favorite = current_user.favorites.find_by(room_id: room.id)
		favorite.destroy
		redirect_to room_path(room)
	end
end
