class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.integer :books_sold_count

      t.timestamps null: false

    end
  end
end
