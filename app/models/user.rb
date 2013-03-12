require 'digest/sha1'
class User < ActiveRecord::Base
  attr_accessible :description, :email, :name, :password, :password_confirmation

  has_many :users_groups
  has_many :groups, :through => :users_groups
  has_many :admin_groups, :class_name => "Group", :foreign_key => "creator_id"

  has_many :features
  has_many :reports

  validates_uniqueness_of [:name, :email]
  validates_presence_of [:name, :email, :password]
  validates_confirmation_of :password
  validates_length_of :name, :in => 2..10, :message => 'name limit in range 2..10'
  #validate email
  validates_format_of :email, :with => /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/, :message => 'Invalid Email'

  #password getter
  def password
  	@password
  end
  #password setter
  def password= (pwd)
  	@password = pwd
  	if pwd.blank?
  		return
  	end
  	create_salt
  	self.hashed_password = User.create_hashed_password(pwd, self.salt)
  end

  #join a group
  def join_group(group)
    UsersGroup.init_join({:user => self, :group => group})
  end

  #auth login
  def self.auth_login(email, pwd)
    user = User.find_by_email(email)
    if user
	   hashed_password = User.create_hashed_password(pwd, user.salt)
	   if hashed_password == user.hashed_password
	     return user
	   end
    end
  end

  #get features by date
  def get_features_by_date(date, group)
    key = Feature.convert_date_key(date)
    if group
      self.features.find(:all, :conditions => ["group_id = ? and year_week = ?", group.id, key])
    else
      self.features.find(:all, :conditions => ["group_id is ? and year_week = ?", nil, key])
    end
  end

  #get report by date
  def get_report_by_date(date, group)
    if group
      self.reports.find(:first, :conditions => ["group_id = ? and created_date like ?" , group.id, date.to_s + "%"])
    else
      self.reports.find(:first, :conditions => ["group_id is ? and created_date like ?" , nil, date.to_s + "%"])
    end
  end

  #create salt and save it
  private
  def create_salt
  	self.salt = self.object_id.to_s + rand.to_s
  end

  #create hashed_password and return it
  def self.create_hashed_password(pwd, salt)
  	string_to_hash = pwd + "web.scrum" + salt
  	Digest::SHA1.hexdigest(string_to_hash)
  end
end
