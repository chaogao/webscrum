class ReportsController < ApplicationController
  layout "scrum"

  before_filter :get_current_user
  before_filter :get_date_report_from_params, :only => ["show", "new", "create"]
  before_filter :check_over_week, :only => ["new"]
  before_filter :check_already_report, :only => ["new", "create"]
  
  #GET admin/reports
  def index
    
	end

  #GET /admin/reports/:id
  def show
    if @report
      @features = @report.get_features
    else
      redirect_to :action => "new", :id => @date
    end
  end

  #GET /admin/reports/new?:id
  def new
      @report = Report.new
      @features = @user.get_features_by_date(@date, @selected_group)
  end

  #POST /admin/reports/
  def create
    @report = Report.create_Report(@user, @selected_group, params[:report])
    @rfs = create_hash_array(params, [:progress_increment, :description, :feature_id])
    if @report.save
      ReportsFeature.create_rfs(@rfs, @report)
      flash[:success] = "Report Created Success"
      redirect_to :action => "show", :id => @report.created_date
    else
      @features = @user.get_features_by_date(@date, @selected_group)
      render :action => "new"
    end    
  end

  private
  def get_date_report_from_params
    begin
      if params[:report] && params[:report][:created_date]
        @date = Date.parse(params[:report][:created_date])
      else
        @date = params[:id] ? Date.parse(params[:id]) : Date.today
      end
    rescue 
      @date = Date.today    
    end
    @report = @user.get_report_by_date(@date, @selected_group)
  end

  def check_over_week
    current_week = Feature.convert_date_key(Date.today)
    create_week = Feature.convert_date_key(@date)
    if current_week != create_week && !@report
      flash[:warning] = "You can only create Report for this Week (#{@date} has nothing forget it ^-^)"
      redirect_to :action => "index"
    end
  end

  def create_hash_array(obj, keys)
    hashed_array = []
    begin
      len = obj[keys[0]].count
      keys.each do |key|
        return nil if obj[key].count != len
      end
      for i in 0..len-1
        o = {}
        keys.each do |key|
          o[key] = obj[key][i]
        end
        hashed_array << o
      end
      return hashed_array
    rescue
      return hashed_array
    end
  end

  def check_already_report
    if @report
      flash[:warning] = "Report was created"
      redirect_to :action => "show", :id => @report.created_date
    end
  end
end
