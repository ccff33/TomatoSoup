class Project < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :name, :description
  
  validates :name, :presence => true
  validates :user, :presence => true
end
