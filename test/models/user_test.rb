# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    ["admin", "support", "client"].each do |role_name|
      Role.create! name: role_name
    end

    @testUser1 = User.create(name: "Admin",
                             surname: "Admin",
                             email: "williboelke@gmail.com",
                             password: "Password42",
                             password_confirmation: "Password42")

    @testUser1.add_role "admin"

    @testUser2 = User.create(name: "User",
                             surname: "User",
                             email: "williboelke@outlook.com",
                             password: "Password42",
                             password_confirmation: "Password42")
    @testUser2.add_role "client"
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


  # roles

  test "user has role admin" do
    assert @testUser1.admin?
  end

  test "user has role client" do
    assert @testUser2.client?
  end

  # abilities

  # admin

  test "admin can destroy Products" do
    ability = Ability.new(@testUser1)
    assert ability.can?(:destroy, Product.new)
  end

  test "admin can edit Products" do
    ability = Ability.new(@testUser1)
    assert ability.can?(:edit, Product.new)
  end

  test "admin can update Products" do
    ability = Ability.new(@testUser1)
    assert ability.can?(:update, Product.new)
  end

  test "admin can create Products" do
    ability = Ability.new(@testUser1)
    assert ability.can?(:create, Product.new)
  end

  test "admin can read all" do
    ability = Ability.new(@testUser1)
    assert ability.can?(:read, Product.new)
  end

  # client

  test "client can not destroy Products" do
    ability = Ability.new(@testUser2)
    assert_not ability.can?(:destroy, Product.new)
  end

  test "client can not edit Products" do
    ability = Ability.new(@testUser2)
    assert_not ability.can?(:edit, Product.new)
  end

  test "client can not update Products" do
    ability = Ability.new(@testUser2)
    assert_not ability.can?(:update, Product.new)
  end

  test "client can not create Products" do
    ability = Ability.new(@testUser2)
    assert_not ability.can?(:create, Product.new)
  end

  test "client can not read all" do
    ability = Ability.new(@testUser2)
    assert ability.can?(:read, Product.new)
  end
end
