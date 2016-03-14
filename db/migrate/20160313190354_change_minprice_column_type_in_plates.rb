class ChangeMinpriceColumnTypeInPlates < ActiveRecord::Migration[5.0]
  def up
      change_column :plates, :min_price, :string, default: "0.0"
    end

    def down
      change_column :plates, :min_price, :decimal, default: 0.0
    end
end
