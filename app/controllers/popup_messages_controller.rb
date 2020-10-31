class PopupMessagesController < ApplicationController

  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @message = current_user.popup_messages.build(popup_message_params)

    respond_to do |format|
      if @message.save
        format.js
      else
        format.js
      end
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @message = PopupMessage.find(params[:id])
    respond_to do |format|
      if @message.update(popup_message_params)
        format.html { redirect_to @message, notice: 'Great!'}
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def destroy
    @message = PopupMessage.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def popup_message_params
    params.require(:popup_message).permit(:message, :link_title, :link)
  end
end
