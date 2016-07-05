class ApplicationController < ActionController::Base
  # before_filter :authenticate_user! #doesn't allow viewing app content without login  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # include CanCan::ControllerAdditions
  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to root_path, :alert => exception.message
  # end
  helper_method :current_ability, :send_simple_message, :get_user_favs
  def current_ability
   @current_ability ||= Ability.new(current_user)
  end

  def get_user_favs
   @user = current_user
   @user_favs = Fav.where(:user_id => @user.id)
  end

  def send_simple_message
   RestClient.post "https://api:key-4c77520a1f204f3f770dc88b91b26177"\
   "@api.mailgun.net/v3/sandbox2c8be1a58fdf465aa9bde6da35cde98c.mailgun.org/messages",
   :from => "Mailgun Sandbox <postmaster@sandbox2c8be1a58fdf465aa9bde6da35cde98c.mailgun.org>",
   :to => "Krum Manoilov <kk.manoilov@gmail.com>",
   :subject => "Hello Krum Manoilov",
   :text => "Congratulations Krum Manoilov, you just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
  end
  # private
  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
end
