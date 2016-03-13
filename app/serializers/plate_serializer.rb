# == Schema Information
#
# Table name: plates
#
#  id             :integer          not null, primary key
#  letters_en     :string           default("")
#  letters_ar     :string           default("")
#  numbers        :integer          default(0)
#  min_price      :decimal(, )      default(0.0)
#  bid_date_hejri :date
#  bid_date_greg  :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  sold           :boolean          default(FALSE)
#

class PlateSerializer < ActiveModel::Serializer
  attributes :id, :letters_en, :letters_ar, :numbers, :min_price, :bid_date_greg, :bid_date_hejri, :sold
end
