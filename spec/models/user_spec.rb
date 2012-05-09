require 'spec_helper'

describe User do
  
  before(:each) do
    @smith = User.new(:username => 'smithmachine',
      :first_name => 'Brian',
      :last_name => 'Smith',
      :password => 'test')
  end
  
  it "should require presence of first_name" do
    @smith.first_name = ''
    @smith.should_not be_valid
  end
  
  it "should require presence of last_name" do
    @smith.last_name = ''
    @smith.should_not be_valid
  end
  
  it "should require presence of username" do
    @smith.username = ''
    @smith.should_not be_valid
  end
  
  it "should require presence of password" do
    @smith.password = ''
    @smith.should_not be_valid
  end
  
  it "should have unique username" do
    existing_user = User.new(:username => @smith.username)
    existing_user.first_name = 'John'
    existing_user.last_name = 'Smith'
    existing_user.password = 'test'
    existing_user.save!
    @smith.should_not be_valid
  end
  
  it "should be able to return all it's projects" do
    @smith.save!
    5.times{Project.create(:name => 'p1', :description => 'desc', :user_id => @smith.id)}
    @smith.projects.size.should == 5
  end
  
end
