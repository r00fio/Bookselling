class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :copies_sold
      t.integer :copies_in_stock

      t.timestamps null: false
      t.references :publisher
      t.references :shop
    end
  end
end
