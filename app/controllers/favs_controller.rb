class FavsController < ApplicationController
  before_action :authenticate_user!
  helper_method :current_ability
  skip_before_filter :verify_authenticity_token

  def new
  	
  	@user = current_user	
    # Rails.logger.debug("My wiwi: #{@user.inspect}")

  	if @user && params[:page]
       @user.favs.create(:webpage_id => params[:page], :user_id => @user)
       redirect_to webpages_path
  	else
  	   redirect_to sign_up_path
  	end
    

  	
  end


end