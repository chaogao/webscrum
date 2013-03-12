class ReportsFeature < ActiveRecord::Base
  attr_accessible :description, :progress_increment
  belongs_to :report
  belongs_to :feature

  validates_numericality_of :progress_increment, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100
  validates_presence_of [:report, :feature]

  def self.create_rfs(rfs, report)
    rfs.each do |rf|
      self.create_rf(rf, report)
    end
  end

  def self.create_rf(rf, report)
    feature = Feature.find(rf[:feature_id])
    report_feature = self.new
    report_feature[:description] = rf[:description]
    #if :progress_increment not a number or less than 0
    begin
      rf[:progress_increment] = Integer rf[:progress_increment]
      rf[:progress_increment] = 0 if rf[:progress_increment] < 0
    rescue
      rf[:progress_increment] = 0
    end
    report_feature[:progress_increment] = self.get_increment(feature, rf[:progress_increment])
    report_feature.feature = feature
    report_feature.report = report
    feature[:use_days] += 1 if report_feature[:progress_increment] > feature[:progress]
    feature[:progress] = report_feature[:progress_increment]
    if feature.save
      return report_feature.save
    else
      return nil
    end
  end

  #get feature progress
  def self.get_increment(feature, increment)
    if increment > 100 || increment < feature.progress
      return feature.progress
    else
      return increment
    end
  end
end
