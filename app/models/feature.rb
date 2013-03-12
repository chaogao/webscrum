class Feature < ActiveRecord::Base
  attr_accessible  :name, :description, :plane_days, :start, :end
  
  belongs_to :user
  belongs_to :group
  belongs_to :ftype

  validates_presence_of [:name, :start, :end, :plane_days]
  validates_numericality_of :plane_days
  validates_numericality_of :progress, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100
  validates_numericality_of :times, :greater_than_or_equal_to => 0
  
  def self.create_feature(user, group, obj, ftype)
    feature = self.new obj
    #from + to
    if ftype.catalog == 0
      feature[:from] = obj[:from]
      feature[:to] = obj[:to]
      feature[:times] = nil
    end
    
    #times = 0
    if ftype.catalog == 1
      feature[:from] = nil
      feature[:to] = nil
      feature[:times] = 0
    end
    
    #times = 1
    if ftype.catalog == 2
      feature[:from] = nil
      feature[:to] = nil
      feature[:times] = 1
    end

    #times > 1
    if ftype.catalog = 3
      feature[:from] = nil
      feature[:to] = nil
      feature[:times] = obj[:times]
    end
    feature[:year_week] = self.convert_date_key(DateTime.now)
    feature.user = user
    feature.group = group if group
    feature.ftype = ftype

    return feature
  end

  def self.convert_date_key(date)
    return date.cweek.to_s + '/' + date.cwyear.to_s
  end
end
