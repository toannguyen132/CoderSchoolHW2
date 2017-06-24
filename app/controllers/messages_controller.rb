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
    # @message.set_read
  end

  def new
    @message = current_user.build_message
    @message.subject = Faker::Lorem.sentence
    @message.body = Faker::Lorem.paragraph
  end

  def create
    count = 0
    params[:recipient_ids].select{|v| !v.empty?}.each do |recipient_id|
      if !recipient_id.empty?
        @message = Message.new(message_params)
        @message.recipient_id = recipient_id
        if @message.save
          count+=1
        end
      end
    end

    flash[:success] = "Your message has been sent to #{count} #{'person'.pluralize(count)}!"
    redirect_to new_message_path

    # if @message.save
    #   flash[:success] = "Your message has been sent!"
    #   redirect_to new_message_path
    # else
    #   flash.now[:error] = @message.errors.full_messages.to_sentence
    #   render new
    # end
  end

  private

  def message_params
    params.require(:message).permit(:subject, :body, :sender_id, :recipient_id, :image)
  end
end
