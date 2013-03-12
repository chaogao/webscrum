class Ruler < ActiveRecord::Base
  attr_accessible :default, :name, :title, :hide

  belongs_to :ftype

  validates_presence_of [:name, :title]
end
