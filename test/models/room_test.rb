require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  def setup
    @room = Room.new(number: "A380")
  end

  test "number should not be too log" do
    @room.number = "a" * 51
    assert_not @room.valid?
  end
end