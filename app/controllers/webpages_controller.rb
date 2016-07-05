class WebpagesController < ApplicationController
   # before_action :authenticate_user!  # Tell devise to use :user map
   helper_method :current_ability, :get_user_favs

   def index
   	if params[:category]
     @webpages  = Webpage.where(:category => params[:category])
     @page  = Webpage.where(:category => params[:category]).first
     @cat = params[:category]
    else
     @webpages  = Webpage.includes([:category]).order('categories.name ASC').all
    end    
   	 @categories = Category.all
    if user_signed_in?
     @user_favs  = get_user_favs
    end
   end

   def show
    if params[:category]
     @webpages  = Webpage.where(:category => params[:category])
     @cat = params[:category]
    else
     @webpages  = Webpage.includes([:category]).order('categories.name ASC').all
    end
  	# @webpages   = Webpage.includes([:category]).order('categories.name ASC').all
   	@categories = Category.all
  	@page    = Webpage.find(params[:id])
   end

end
