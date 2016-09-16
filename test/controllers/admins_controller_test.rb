require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @admin = Admin.new(name: "Example User", email: "user@example.com",
                       password: "foobar", password_confirmation: "foobar")

    @room = Room.new(number: "A380")

  end



  test "Admin should be able to login as admin" do

  end

  test "Admin should be able to show anyone's profile" do

  end

  test "created Admin should not be able to creat/delete new admin" do

  end

  test "Root admin shoud be able to creat/delete new admin" do

  end

  test "Admin should be able to edit/add/delete room detail" do

  end

  test "Admin should be able to delete a member" do

  end
end
