class AddItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :user
      t.string :desired_name
      t.integer :desired_price
      t.string :base_name
      t.integer :base_price
      t.timestamps
    end
  end
end


