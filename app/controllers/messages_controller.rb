class MessagesController < ApplicationController
	def index
    clause = "(from = ? AND to = ?) OR (from = ? AND to = ?)"
    @messages = Message.where(clause, params[:users], params[:users])
	end
 
 def create
    @message = Message.new(params[:message])
    @message.save
  end
end
