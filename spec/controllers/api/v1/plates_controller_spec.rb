require 'spec_helper'

RSpec.describe Api::V1::PlatesController, type: :controller do
  describe 'GET #index' do
    before do
      10.times { FactoryGirl.create :plate }
      get :index
    end

    it 'return 10 records from database' do
      plates_response = json_response[:plates]
      expect(plates_response.size).to eql 10
    end

    it 'returns the correct json response' do
      plates_response = json_response[:plates]
      plates_response.each do |plate_response|
        expect(plate_response[:letters_en]).to be_present
      end
    end

    it { should respond_with 200 }
  end
end
