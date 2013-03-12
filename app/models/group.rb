class Group < ActiveRecord::Base
  attr_accessible :contact, :description, :head_img, :name

  has_many :users_groups, :dependent => :destroy
  has_many :users, :through => :users_groups

  belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"

  validates_presence_of [:name, :description, :contact, :creator_id]
  validates_uniqueness_of :name
  validates_length_of :name, :in => 2..20, :message => 'name limit in range 2..20'

  def get_reports_from_date(date)
    reports = []
    self.users.each do |user|
      item = {}
      report = user.get_report_by_date(date, self)
      if report
        report[:features] = report.features
        report[:user] = user
        reports << report
      end
    end
    return reports
  end

  #create a group and init join
  def self.create_group (user, group_info)
    group = self.new group_info
    group.creator = user
    if group.save
      #init join with admin auth num-2
      UsersGroup.init_join({:user => user, :group => group, :auth => 2})
    end
    return group
  end
end
