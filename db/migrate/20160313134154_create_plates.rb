class CreatePlates < ActiveRecord::Migration[5.0]
  def change
    create_table :plates do |t|
      t.string :letters_en
      t.string :letters_ar
      t.integer :numbers
      t.decimal :min_price
      t.date :bid_date_hejri
      t.date :bid_date_greg

      t.timestamps
    end
  end
end
