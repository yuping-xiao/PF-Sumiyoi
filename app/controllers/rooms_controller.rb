class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
  	@rooms = Room.all
  end

  def new
  	@room = Room.new
    @room.room_images.build
  end

  def create
  	@room = Room.new(room_params)
    @room.user_id = current_user.id
  	if @room.save
  		flash[:notice] = "物件が登録されました！"
  		redirect_to room_path(@room.id)
  	else
  		@room = Room.new(room_params)
      flash[:notice] = "正常に登録されていません。再度登録してください。"
  		render 'new'
  	end
  end

  def show
    @room = Room.find(params[:id])
    @room_comment = RoomComment.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
    @rooms = Room.search(params[:search])
  end

  private
  def room_params
  	params.require(:room).permit(:name, :address, :condition, :link, :living_status, room_images_images: [])
  end

end
