class MessagesController < ApplicationController
	def index
    puts params[:users]
    @messages = Message.where("(sender = :u1 AND receiver = :u2) OR (sender = :u2 AND receiver = :u1)",
                              {u1: params[:users][0], u2: params[:users][1]}).order(updated_at: :desc).find_in_batches
    render json: @messages
	end
 
 def create
    @message = Message.new()
    @message.sender = params[:sender]
    @message.receiver = params[:receiver]
    @message.text = params[:text]
    @message.save
    render json: @message
  end
end
