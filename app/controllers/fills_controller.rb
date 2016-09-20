class FillsController < ApplicationController
  def index
    render json: {
      fills: Fill.all
    }
  end

  def create
    Logger.new(STDOUT).info fill_params
    fill = Fill.create(fill_params)

    render json: {
      fill: fill
    }
  end

  private

  def fill_params
    params.require(:fill).permit(
      :patient_name,
      :address_attributes => [
        :street_1,
        :street_2,
        :city,
        :state,
        :zip
      ]
    )
  end
end
