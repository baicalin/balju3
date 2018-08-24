class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_owner.chat_rooms.build(chat_room_params)
    @chat_room.lat = params[:chat_room][:lat]
    @chat_room.lng = params[:chat_room][:lng]
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end
  private

  def chat_room_params
    params.require(:chat_room).permit(:title, :lat, :lng)
  end
end
