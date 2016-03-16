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

class Trnaslate < ApplicationRecord

  def self.translate(arabic_string)
    arabic_string = arabic_string.gsub(/\s+/, "")

    ar_letter1 = arabic_string[0]
    ar_letter2 = arabic_string[1]
    ar_letter3 = arabic_string[2]

    en_letter1 = find_by(arabic_letter: ar_letter1).english_letter
    en_letter2 = find_by(arabic_letter: ar_letter2).english_letter
    en_letter3 = find_by(arabic_letter: ar_letter3).english_letter

    letters_en = "#{en_letter1} #{en_letter2} #{en_letter3}"
  end
end
