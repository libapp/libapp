require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @member = Member.new(name: "Example User", email: "user@example.com",
                         password: "foobar", password_confirmation: "foobar")
  end

  test "Member should be able to login" do

  end

  test "Member should be able to book a room" do

  end

  test "Member should be able to release a booked room NOT a free room" do

  end

  test "Member should be able to edit his profile" do

  end

  test "Member should be able to search for a room" do

  end

  test "Searched room should be relevant" do  # important may be more test case needed

  end


end
