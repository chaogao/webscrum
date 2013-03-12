class Report < ActiveRecord::Base
  attr_accessible :content, :title, :user_id

  validates_presence_of [:content, :title, :user_id, :created_date]
  belongs_to :user
  belongs_to :group

  has_many :reports_features
  has_many :features, :through => :reports_features, :select => ['name', 'progress_increment', 'progress', 'reports_features.description', 'plane_days', 'use_days']

  def self.create_Report(user, group, obj)
    if obj[:created_date]
      date = Date.parse(obj[:created_date])
      obj.delete("created_date");
    end
    report = self.new obj
    report.user = user
    report.group = group if group
    report[:created_date] = date if date
    return report
  end

  def get_features
    self.features
  end
end
