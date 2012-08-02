require 'spec_helper'

class Admin < User; end

describe LazyResource::Resource do
  describe '#new' do
    it 'creates an object with the specified attributes' do
      user = User.new({ :name => 'Andrew', :id => 123 })
      user.name.should == 'Andrew'
      user.id.should == 123
    end
  end

  describe '#==' do
    it 'returns true if the objects have the same type and data' do
      user1 = User.new(:name => 'Andrew', :id => 123)
      user2 = User.new(:name => 'Andrew', :id => 123)
      user1.should == user2
    end

    it 'returns false if the objects do not have the same type' do
      user = User.new(:name => 'Andrew')
      admin = Admin.new(:name => 'Andrew')
      user.should_not == admin
    end

    it 'returns false if the objects do not have the same data' do
      user1 = User.new(:name => 'Andrew')
      user2 = User.new(:name => 'James')
      user1.should_not == user2
    end
  end

  describe '#eql?' do
    it 'returns true if the objects have the same type and data' do
      user1 = User.new(:name => 'Andrew', :id => 123)
      user2 = User.new(:name => 'Andrew', :id => 123)
      user1.eql?(user2).should == true
    end

    it 'returns false if the objects do not have the same type' do
      user = User.new(:name => 'Andrew')
      admin = Admin.new(:name => 'Andrew')
      user.eql?(admin).should == false
    end

    it 'returns false if the objects do not have the same data' do
      user1 = User.new(:name => 'Andrew')
      user2 = User.new(:name => 'James')
      user1.eql?(user2).should == false
    end
  end
end
