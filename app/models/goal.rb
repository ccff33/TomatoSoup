class Goal < ActiveRecord::Base
  belongs_to :project
  
  POMODORO_IN_MINUTES = 25.minutes / 1.minute
  
  attr_accessible :name, :estimated_time
  
  validates :name, :presence => true
  validates :project, :presence => true
  validates :estimated_time, :numericality => {:greater_than_or_equal_to => 0}
  
  def pomodoro_up
    self.real_time += POMODORO_IN_MINUTES
  end
  
end