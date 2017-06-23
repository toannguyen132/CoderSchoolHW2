class MessagesController < ApplicationController
  def index
    @messages = current_user.messages
  end

  def sent
    @messages = current_user.sent_messages
  end

  def show
    @message = Message.find_by_id(params[:id])

    # set as read
    @message.set_read
  end

  def new
    @message = current_user.build_message
    @message.subject = Faker::Lorem.sentence
    @message.body = Faker::Lorem.paragraph
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = "Your message has been sent!"
      redirect_to new_message_path
    else
      flash.now[:error] = @message.errors.full_messages.to_sentence
      render new
    end
  end

  private
   def message_params
    params.require(:message).permit(:subject, :body, :sender_id, :recipient_id)
   end

end
