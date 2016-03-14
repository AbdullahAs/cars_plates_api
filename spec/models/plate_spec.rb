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

  it 'should only return plates which are not sold yet' do
    expect(Plate.available).to match_array([@plate2])
  end
end
