class Api::V1::PlatesController < ApplicationController
  respond_to :json

  def index
    plates = Plate.search(params)
    render json: plates, status: 200
  end

  def show
    plate = Plate.find(params[:id])
    render json: plate, status: 200
  end
end
