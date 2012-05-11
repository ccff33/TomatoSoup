class Goal < ActiveRecord::Base
  belongs_to :project
  
  attr_accessible :name, :estimated_time
  
  validates :name, :presence => true
  validates :project, :presence => true
  validates :estimated_time, :numericality => {:greater_than_or_equal_to => 0}
  
end
