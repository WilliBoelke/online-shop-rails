# frozen_string_literal: true

require "test_helper"

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

class RoleTest < ActiveSupport::TestCase

  test "user has role admin" do
    assert @testUser1.admin?
  end

  test "user has role client" do
    assert @testUser2.client?
  end
end
