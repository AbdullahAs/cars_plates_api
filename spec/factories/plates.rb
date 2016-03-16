# == Schema Information
#
# Table name: plates
#
#  id             :integer          not null, primary key
#  letters_en     :string           default("")
#  letters_ar     :string           default("")
#  numbers        :string           default("0 0 0 0")
#  min_price      :string           default("0.0")
#  bid_date_hejri :date
#  bid_date_greg  :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  sold           :boolean          default(FALSE)
#

FactoryGirl.define do
  factory :plate do
    letters_en "A A A"
    letters_ar "أ أ أ"
    numbers 1234
    min_price "500.00"
    bid_date_hejri "2016-03-13"
    bid_date_greg "2016-03-13"
    sold false
  end
end
