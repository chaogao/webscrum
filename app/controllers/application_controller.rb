class ApplicationController < ActionController::Base
  before_filter :authorize, :except => [:login, :logout, :registe]

  protect_from_forgery


  protected
  #used in before_filter
  def authorize
  	unless User.find_by_id(session[:user_id])
  		flash[:warning] = "Please Login"
  		redirect_to :controller => 'user', :action => 'login'
  	end
  end

  #used in action, can redirect to home page
  #most used in user_controller
  def authorize_redirect
  	if session[:user_id]
		redirect_to :controller => 'home'
  	end
  end

  #get current user
  def get_current_user
  	if session[:user_id]
  		@user = User.find_by_id(session[:user_id])
  	end
    if session[:group]
      @selected_group = Group.find(session[:group])
    end
  end

  #get visitor
  def get_visitor
	  if params[:id] && params[:id]
		  @visitor = User.find_by_id(params[:id])
	  end
	  if @visitor.blank?
		  redirect_to :controller => 'home'
	  end
  end
end
