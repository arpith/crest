require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "should not save message without text" do
    message = Message.new
    assert_not message.save
  end

  test "should not save message without receiver" do
    message = Message.new
    assert_not message.save
  end

  test "should not save message without sender" do
    message = Message.new
    assert_not message.save
  end
end
