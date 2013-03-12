class FeaturesController < ApplicationController
  layout "scrum"

  before_filter :get_current_user
  
  #GET /scrum/features
  def index
    @features = @user.get_features_by_date(DateTime.now, @selected_group)
  end

  #GET /scrum/features/new
  def new
    @feature = Feature.new
    @ftypes = Ftype.get_by_user(@user)
    @date = Date.today
  end

  #POST /scrum/features
  def create
    @feature = Feature.create_feature(@user, @selected_group, params[:feature])
    #determine the feature save successed
    if @feature.save
      flash[:success] = "Create Successed"
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
end
