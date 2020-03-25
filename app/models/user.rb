# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  rolify


  before_save { email.downcase! }
  after_create :assign_default_role
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :surname, presence: true, length: { minimum: 3, maximum: 20 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :email, uniqueness: true
  validates :password, presence: true, length: { minimum: 8, maximum: 40 }



  def assign_default_role
    if not has_role?(:admin)
      self.add_role("client")
    end
  end

  def admin?
    has_role?(:admin)
  end

  def client?
    has_role?(:client)
  end
end
