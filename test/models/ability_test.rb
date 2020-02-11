require "test_helper"

class AbilityTest < ActiveSupport::TestCase

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
