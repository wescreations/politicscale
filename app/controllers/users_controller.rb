class UsersController < ApplicationController

before_action :authenticate_user!

  def index

  @user = User.all
     @x = Notification.where(:user_id =>  current_user, :read => false).all.order! 'created_at DESC'
  end


  def edit
     render :layout => 'test'
  	@user = User.find(params[:id])
     @notifications = Notification.all.order! 'created_at DESC'
@x = Notification.where(:user_id =>  current_user, :read => false).all.order! 'created_at DESC' 
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  		flash[:notice] = "User Created."
  		redirect_to(users_path)
  	else
  		render('edit')
  	end
  end

  def delete
  	@user = User.find(params[:id])  	
  end


  def destroy
  	@user = User.find(params[:id])  
  	@user.destroy
  	flash[:notice] = "User Destroyed."
  	redirect_to(users_path)	
  end

  private

  def user_params
  	params.require(:user).permit(:_method, :authenticity_token, 
      :user, :commit, :id, :admin, :name, :state)
  		
  end



end
