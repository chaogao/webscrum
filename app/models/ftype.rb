class Ftype < ActiveRecord::Base
  attr_accessible :catalog, :description, :name, :user_id, :show

  validates_presence_of [:name]
  has_many :rulers, :dependent => :destroy

  def self.get_by_user(user)
  	self.find(:all, :conditions => ["user_id is ? or user_id = ?", nil, user.id])
  end

  #create ftype with ruler
  def self.create_ftype(params, user)
    rulers = params[:rulers]
    params.delete("rulers")
    p params
    p rulers
    ftype = self.new params
    rulers.each do |key, value|
      if !value[:name].empty? && !value[:title].empty?
        ftype.rulers << Ruler.new(value)
      end
    end
    return ftype
  end
end
