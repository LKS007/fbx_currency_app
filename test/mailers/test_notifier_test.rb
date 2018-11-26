require 'test_helper'

class TestNotifierTest < ActionMailer::TestCase
  test "add test for check coveralls" do
    mail = TestNotifier.received.deliver
    assert !ActionMailer::Base.deliveries.empty?
    #p mail
  end


end
