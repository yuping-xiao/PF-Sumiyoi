class RoomCommentsController < ApplicationController

	def create
		room = Room.find(params[:room_id])
		comment = current_user.room_comments.new(room_comment_params)
		comment.room_id = room.id
		comment.save
		redirect_to room_path(room)
	end

	def destroy
		RoomComment.find_by(id: params[:id],room_id: params[:room_id]).destroy
		redirect_back(fallback_location: root_path)
	end

	private
	def room_comment_params
		params.require(:room_comment).permit(:comment)
	end
end
