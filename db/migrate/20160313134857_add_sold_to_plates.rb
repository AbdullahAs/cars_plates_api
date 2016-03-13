class AddSoldToPlates < ActiveRecord::Migration[5.0]
  def change
    add_column :plates, :sold, :boolean
  end
end
