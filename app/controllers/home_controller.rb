class HomeController < ApplicationController
	before_filter :get_current_user
	before_filter :get_visitor, :only => "show"

	#index redirect to login page or home page
	def index

	end

  #show all groups
  def groups
    @groups = @user.groups
  end
  
  #POST /home/:id/select
  #select a group
  def select
    if Integer(params[:id]) == -1
      session[:group] = nil
      redirect_to :action => "index"
    else
      @group = @user.groups.find(params[:id])
      if @group
        session[:group] = @group.id
        redirect_to :action => "index"
      else
        flash[:error] = "You selected a unkown group"
        redirect_to :action => "groups"    
      end
    end
  end

	#show home page
	def show
		
	end
end
