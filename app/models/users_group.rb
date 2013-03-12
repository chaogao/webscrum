class UsersGroup < ActiveRecord::Base
  attr_accessible :auth, :group_id, :join_time, :user_id
  belongs_to :user
  belongs_to :group

  #init join, create a join between user and group
  def self.init_join(obj)
    join = self.new
    join.user = obj[:user]
    join.group = obj[:group]
    join.auth = obj[:auth] if obj[:auth]
    join.join_time = Time.now
    p join
    join.save
  end
  
  class << self
    def welcome
      puts "welcome"
    end
  end  
end
