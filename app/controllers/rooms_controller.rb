class RoomsController < ApplicationController

  def index
  	@rooms = Room.all
  end

  def new
  	@room = Room.new
  end

  def create
  	@book = Room.new(room_params)
  	if @book.save
  		flash[:notice] = "物件が登録されました！"
  		redirect_to root_path
  	else
  		@book = Room.new
  		render 'new'
  	end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def room_params
  	params.require(:room).permit(:name, :address, :condition, :link, :living_status)
  end

end
