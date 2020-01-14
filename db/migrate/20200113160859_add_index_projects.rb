class AddIndexProjects < ActiveRecord::Migration[6.0]
  def change
      add_index :products, :name
      add_index :products, :price
  end
end
