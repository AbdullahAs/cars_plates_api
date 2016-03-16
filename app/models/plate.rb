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

class Plate < ApplicationRecord

  scope :recent, -> {
    where("bid_date_greg = ?", Plate.last.bid_date_greg)
  }

  scope :available, -> {
    where("sold = ?", false)
  }

  # not avilable now sinc the numbers is string
  # scope :equal_or_less, lambda { |price|
  #   where("min_price <= ?", price)
  # }

  def self.search(params = {})
    plates = Plate.all
    plates = plates.where(letters_ar: params[:letters_ar]) if params[:letters_ar].present?
    # plates = plates.equal_or_less if params[:max_price].present?
    plates = plates.available if params[:available].present?
    plates
  end

  def check_availability
    update(sold: true) if bid_date_greg <= Date.today
  end

  def generate_english_letters
    p letters_en = Trnaslate.translate(self.letters_ar)
    update(letters_en: letters_en)
  end
end
