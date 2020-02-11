# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup

    @testUser1 = User.create(name: "Admin",
                             surname: "Admin",
                             email: "williboelke@gmail.com",
                             password: "Password42",
                             password_confirmation: "Password42")

    @testUser2 = User.create(name: "User",
                             surname: "User",
                             email: "williboelke@outlook.com",
                             password: "Password42",
                             password_confirmation: "Password42")
  end

  test "should be valid" do
    assert @testUser1.valid?
    assert @testUser2.valid?
  end


  # name

  test "min length for name" do
    @testUser1.name = "abc"
    assert @testUser1.valid?
  end

  test "max length for name" do
    @testUser1.name = "a" * 20
    assert @testUser1.valid?
  end

  test "name to short" do
    @testUser1.name = "ab"
    assert_not @testUser1.valid?
  end

  test "name to long" do
    @testUser1.name = "a" * 21
    assert_not @testUser1.valid?
  end


  # surname

  test "min length for surname" do
    @testUser1.surname = "abc"
    assert @testUser1.valid?
  end

  test "max length for surname" do
    @testUser1.surname = "a" * 20
    assert @testUser1.valid?
  end

  test "surname to short" do
    @testUser1.surname = "ab"
    assert_not @testUser1.valid?
  end

  test "surname to long" do
    @testUser1.surname = "a" * 21
    assert_not @testUser1.valid?
  end

  # password

  test "min length for password" do
    @testUser1.password = "abcdefgh"
    @testUser1.password_confirmation = "abcdefgh"
    assert @testUser1.valid?
  end

  test "max length for password" do
    @testUser1.password =  "a" * 40
    @testUser1.password_confirmation = "a" * 40
    assert @testUser1.valid?
  end

  test "password to short" do
    @testUser1.password =  "abcdefg"
    @testUser1.password_confirmation = "abcdefg"
    assert_not @testUser1.valid?
  end

  test "password to long" do
    @testUser1.password =  "a" *41
    @testUser1.password_confirmation = "a" *41
    assert_not @testUser1.valid?
  end

  test "password and conformation dont match" do
    @testUser1.password =  "PasswordTest"
    @testUser1.password_confirmation = "Password213" *41
    assert_not @testUser1.valid?
  end

end
