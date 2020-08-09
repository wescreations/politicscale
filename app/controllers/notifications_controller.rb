class NotificationsController < ApplicationController
  def index
  	    @notifications = Notification.all.order! 'created_at DESC'
  end


end


