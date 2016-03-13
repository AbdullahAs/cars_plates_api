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

FactoryGirl.define do
  factory :plate do
    letters_en "A A A"
    letters_ar "أ أ أ"
    numbers 1234
    min_price "500.00"
    bid_date_hejri "2016-03-13"
    bid_date_greg "2016-03-13"
  end
end
