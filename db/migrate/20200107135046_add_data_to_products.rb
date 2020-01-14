class AddDataToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :cloth_type, :string
  end
end
