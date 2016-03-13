class Api::V1::PlatesController < ApplicationController
  respond_to :json

  def index
    plates = Plate.all
    render json: plates, status: 200
  end
end
