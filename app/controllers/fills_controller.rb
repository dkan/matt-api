class FillsController < ApplicationController
  def index
    render json: {
      fills: Fill.all
    }
  end

  def create
    ActiveRecord::Base.transaction do
      fill = Fill.create(fill_params)
      address = Address.create(fill_params[:address_attributes].merge({fill_id: fill.id}))

      render json: {
        fill: fill
      }
    end
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

# {
#   fill: {
#     patient_name: "name",
#     address: {
#       street_1: '',
#       street_2: '',
#       city: '',
#       state: '',
#       zip: '',
#     }
#   }
# }
