require 'test_helper'

class SubscriberTest < ActiveSupport::TestCase 

  def setup
    @subscriber = Subscriber.new(name:"abcd",email:"a.b@c.com")
  end

 test "Subscriber should be valid" do
   assert @subscriber.valid?
 end

test "name should be present" do
  @subscriber.name = " "
  assert_not @subscriber.valid?
end

test "name should be unique" do
  @subscriber.save
  @subscriber2 = Subscriber.new(name: "abcd",email:"d.e@f.com")
  assert_not @subscriber2.valid?
end


end