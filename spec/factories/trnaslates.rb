# == Schema Information
#
# Table name: trnaslates
#
#  id             :integer          not null, primary key
#  english_letter :string
#  arabic_letter  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryGirl.define do
  factory :trnaslate do
    english_letter "A"
    arabic_letter "أ"
  end
end
