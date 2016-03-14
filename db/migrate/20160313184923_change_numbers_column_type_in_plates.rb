class ChangeNumbersColumnTypeInPlates < ActiveRecord::Migration[5.0]
  def up
    change_column :plates, :numbers, :string, default: "0 0 0 0"
  end

  def down
    change_column :plates, :numbers, :integer, default: 0
  end
end
