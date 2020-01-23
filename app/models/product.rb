# frozen_string_literal: true

class Product < ApplicationRecord
  scope :new_to_old, -> { order(created_at: :desc) }
  scope :old_to_new, -> { order(:created_at) }
  scope :alphabetic, -> { order(:name) }
  scope :low_to_high, -> { order(:price) }
  scope :high_to_low, -> { order(price: :desc) }

  scope :all_types, -> { all }
  scope :shirt_only, -> { where("cloth_type = 'T-Shirt'") }
  scope :pullover_only, -> { where("cloth_type = 'Pullover'") }
end
