class CreateBatchBottleSettings < ActiveRecord::Migration
  def change
    create_table :batch_bottle_settings do |t|
      t.timestamps
      t.integer :batch_id
      t.integer :kind
      t.integer :quantity
      t.string :unit
    end
  end
end
