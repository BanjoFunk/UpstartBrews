class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :package_type_id
      t.integer :batch_id
      t.integer :quantity
      t.integer :state, null: false, default: 0
      t.timestamps
    end
  end
end

