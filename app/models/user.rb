# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  after_create :assign_default_role

  def assign_default_role
    self.add_role("client") if self.roles.blank?
  end

  def admin?
    has_role?(:admin)
  end

  def client?
    has_role?(:client)
  end
end
