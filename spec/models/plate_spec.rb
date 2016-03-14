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

require 'spec_helper'

describe Plate do
  let(:plate) { FactoryGirl.build :plate }
  subject { plate }

  it { should respond_to :letters_en }
  it { should respond_to :letters_ar }
  it { should respond_to :numbers }
  it { should respond_to :min_price }
  it { should respond_to :bid_date_hejri }
  it { should respond_to :bid_date_greg }

  it { should_not be_sold }
end

describe '.recent' do
  before do
    @plate1 = FactoryGirl.create :plate,  letters_en: 'Z Z Z',
                                          bid_date_greg: Date.yesterday
    @plate2 = FactoryGirl.create :plate,  letters_en: 'Y Y Y',
                                          bid_date_greg: Date.today
  end

  it 'should only return plates which have same date as latest plate' do
    expect(Plate.recent).to match_array([@plate2])
  end
end

describe '.available' do
  before do
    @plate1 = FactoryGirl.create :plate, sold: true
    @plate2 = FactoryGirl.create :plate, sold: false
  end

  it 'returns only plates which are not sold yet' do
    expect(Plate.available).to match_array([@plate2])
  end
end

# describe '.equal_or_less' do
#   before do
#     @plate1 = FactoryGirl.create :plate, min_price: 500
#     @plate2 = FactoryGirl.create :plate, min_price: 300
#   end

#   it 'returns plates equal or less than 300' do
#     expect(Plate.equal_or_less(300)).to match_array([@plate2])
#   end
# end

describe '.search' do
  before do
    @plate1 = FactoryGirl.create :plate,  letters_en: 'A A A',
                                          letters_ar: 'ا ي س',
                                          min_price: 300
    @plate2 = FactoryGirl.create :plate,  letters_en: 'B B B',
                                          letters_ar: 'ب ص ف',
                                          min_price: 500
    @plate3 = FactoryGirl.create :plate,  letters_en: 'A K J',
                                          letters_ar: 'ا ي س',
                                          min_price: 300
    @plate4 = FactoryGirl.create :plate,  letters_en: 'L Y A',
                                          letters_ar: 'ي ض ف',
                                          min_price: 1000
  end

  context 'when arabic letters is passed' do

    it 'return emptay array if letters doesnt match any recprd' do
      search_hash = { letters_ar: 'ف ي س' }
      expect(Plate.search(search_hash)).to be_empty
    end

    it 'returns the plates with same letters' do
      search_hash = { letters_ar: 'ا ي س'}
      expect(Plate.search(search_hash)).to match_array([@plate1, @plate3])
    end
  end

  # context 'when max price is passed' do
  #   it 'returns the plates with price equal or less than price' do
  #     search_hash = { max_price: '300'}
  #     expect(Plate.search(search_hash)).to match_array([@plate1, @plate3])
  #   end
  # end
end