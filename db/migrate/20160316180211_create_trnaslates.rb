class CreateTrnaslates < ActiveRecord::Migration[5.0]
  def change
    create_table :trnaslates do |t|
      t.string :english_letter
      t.string :arabic_letter

      t.timestamps
    end
  end
end
