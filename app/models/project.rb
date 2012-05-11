class Project < ActiveRecord::Base
  belongs_to :user
  has_many :goals
  
  attr_accessible :name, :description
  
  validates :name, :presence => true
  validates :user, :presence => true
  
  def hide
    self.archive_flag = true
    save
  end
  
  def self.active
    where :archive_flag => false
  end
  
  def self.paginate_filtered(page, per_page, name_filter)
    paginate :page => page,
             :per_page => per_page,
             :conditions => ['name like :filter', :filter => '%' + name_filter + '%'],
             :order => 'created_at desc'
  end
  
end
