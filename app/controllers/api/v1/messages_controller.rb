class Api::V1::MessagesController < ApplicationController
  def index
    @messages = Message.select(channel: Channel.find_by(name: params[:channel_id]))
    render json: @messages
  end

  def create
  end
end
