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
#

class Plate < ApplicationRecord
end
