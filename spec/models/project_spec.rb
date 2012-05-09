require 'spec_helper'

describe Project do
  
  before(:each) do
    @owner = User.new(:username => 'smithmachine',
      :first_name => 'Brian',
      :last_name => 'Smith',
      :password => 'test')
    @owner.save!
    @project = Project.new(:name => 'project', :description => 'desc', :user_id => @owner.id)  
  end
  
  it "should belong to a user" do
    @project.user_id = 1000
    @project.should_not be_valid
  end
  
  it "should require presence of name" do
    @project.name = ''
    @project.should_not be_valid
  end
  
  it "should be valid if everything is OK" do
    @project.should be_valid
  end
  
end
