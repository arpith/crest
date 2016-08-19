class MessagesController < ApplicationController
	def index
    @messages = Message.where("(from = :u1 AND to = :u2) OR (from = :u2 AND to = :u1)", 
                              {u1: params[:users][0], u2: params[:users][1]})
	end
 
 def create
    @message = Message.new(params[:message])
    @message.save
  end
end
