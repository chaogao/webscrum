class GroupsController < ApplicationController
  before_filter :get_current_user
  before_filter :valid_auth, :only => ["new", "create"]
  before_filter :valid_auth_group_joined_created, :only => ["edit", "update", "show", "reports", "members"]
  before_filter :valid_joined_redirect, :only => ["reports", "members"]
  before_filter :valid_created_redirect, :only => ["edit", "create", "update"]

  #GET /groups
  def index
    @all_groups = Group.find(:all)
  end

  #GET /groups/new
  def new
    @group = Group.new 
  end

  #GET /groups/:id/edit
  def edit
  end

  #GET /groups/:id
  def show
    if @joined
      redirect_to :action => "reports", :id => @group
    end
  end

  #GET /groups/:id/reports
  def reports
    begin
      date = params[:date] ? Date.parse(params[:date]) : Date.today      
    rescue
      date = Date.today
    end
    @reports = @group.get_reports_from_date(date)
  end

  #POST /groups/:id/join
  #current user join the group
  def join
    @group = Group.find_by_id(params[:id])
    if @group
      @user.join_group(@group)
      flash[:success] = "Join It Successed"
      redirect_to :action => "reports", :id => @group
    else
      flash[:warning] = "Not Exist Group to Join"
    end
  end

  #POST /groups
  def create
    @group = Group.create_group(@user, params[:group])
    #determine the group save successed
    if @group.new_record?
      render :action => "new"
    else
      flash[:success] = "Create Successed"
      redirect_to :action => "index"
    end
  end

  #PUT /groups/:id
  def update
  	@group = Group.find_by_id(params[:id])
  	if @group.update_attributes(params[:group])
  	  flash[:success] = "Update Successed"
  	  redirect_to :action => "reports", :id => @group
  	else
  	  render :action => "edit"
  	end
  end

  # DELETE /groups/1
  def destroy
    @group = Group.find_by_id(params[:id])
    @group.destroy
    flash[:success] = "Destroy Successed"
  	redirect_to :action => "index"
  end

  private
  #valid auth or redirect
  def valid_auth
    if @user.auth == 0
      flash[:warning] = "Your can not create Team"
      redirect_to :action => "index"
    end
  end

  #valid group: if no exist group, redirect to index
  #vaild joined created: determind if the current user is joined the group
  #and created the group 
  def valid_auth_group_joined_created
    @group = Group.find_by_id(params[:id])
    if @group
      @joined = @group.users.include?(@user)
      @created = @group.creator == @user
    else
      flash[:warning] = "Not Exist Group"
      redirect_to :action => "index"
    end
  end
  
  #valid_created_redirect
  def valid_created_redirect
    unless @created
      redirect_to :action => "show", :id => @group
    end
  end

  #valid_joined_redirect
  def valid_joined_redirect
    unless @joined
      redirect_to :action => "show", :id => @group
    end
  end
end
