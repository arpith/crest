class MessagesController < ApplicationController
	def index
    @messages = Message.where("(from = :u1 AND to = :u2) OR (from = :u2 AND to = :u1)", 
                              {u1: params[:users][0], u2: params[:users][1]})
	end
 
 def create
    @message = Message.new()
    @message.from = params[:from]
    @message.to = params[:to]
    @message.text = params[:text]
    @message.save
    render json: @message
  end
end
