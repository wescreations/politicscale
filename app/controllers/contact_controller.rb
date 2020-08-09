class ContactController < ApplicationController


  def index
    @contact = Contact.new(params[:contact])
    @x = Notification.where(:user_id =>  current_user, :read => false).all.order! 'created_at DESC'

  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        # re-initialize contact object for cleared form
        @contact = Contact.new
        format.html { render 'contact/index'}
        format.js   { flash.now[:success] = @message = "Thank you for your message. I'll get back to you soon!" }
      else
        format.html { render 'contact/index' }
        format.js   { flash.now[:error] = @message = "Message did not send." }
      end
    end
  end

end
