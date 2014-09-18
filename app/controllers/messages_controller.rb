class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end


  def create

    @recipients = []

    params[:message][:to].values.each_with_index do |i, index|
      if i == "1"
        @recipients << params[:message][:to].keys[index]
      end
    end

    @recipients.each do |recipient|
      @message = Message.new({:to => recipient, :from => current_user.phone, :body => params[:message][:body]})
      if @message.save
        flash[:notice] = "Your message to #{recipient} has been sent!"
      end
    end
    redirect_to messages_path
  end

  def show
    @message = Message.find(params[:id])
  end

private

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end

end
