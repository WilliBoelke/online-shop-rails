# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.client?
      can :read, :all
    else
      can :read, Product
    end
  end
end
