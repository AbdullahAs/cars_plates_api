# == Schema Information
#
# Table name: plates
#
#  id             :integer          not null, primary key
#  letters_en     :string
#  letters_ar     :string
#  numbers        :integer
#  min_price      :decimal(, )
#  bid_date_hejri :date
#  bid_date_greg  :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  sold           :boolean

class AddDefaultValuesToPlate < ActiveRecord::Migration[5.0]
  def change
    change_column :plates, :letters_en, :string, default: ""
    change_column :plates, :letters_ar, :string, default: ""
    change_column :plates, :numbers, :integer, default: 0
    change_column :plates, :min_price, :decimal, default: 0.0
    change_column :plates, :sold, :boolean, default: false
  end
end
