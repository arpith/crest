class MessagesController < ApplicationController
	def index
    puts params[:users]
    @messages = Message.where("(sender = :u1 AND receiver = :u2) OR (sender = :u2 AND receiver = :u1)",
                              {u1: params[:user1], u2: params[:user2]}).order(updated_at: :desc)
    render json: @messages
	end
 
 def create
    @message = Message.new()
    @message.sender = params[:sender]
    @message.receiver = params[:receiver]
    @message.text = params[:text]
    @message.save
    render status: 201, json: @message
  end
end
