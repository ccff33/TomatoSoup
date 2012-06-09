class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  attr_accessible :username, :first_name, :last_name, :password, :password_confirmation
  
  validates :username, :presence => true, :uniqueness => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :password, :presence => true, :confirmation => true
  
  has_many :projects
  
end
