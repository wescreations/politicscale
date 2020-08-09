class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?

protected


	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :admin, :name, :state])
		devise_parameter_sanitizer.permit(:account_update, keys: [:username, :avatar, :admin, :name, :state])
	end

  def respond_modal_with(*args, &blk)
    options = args.extract_options!
    options[:responder] = ModalResponder
    respond_with *args, options, &blk
  end
end
