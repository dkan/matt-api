class Fill < ActiveRecord::Base
  has_one :address
  accepts_nested_attributes_for :address

  def as_json(options = {})
    super(options.merge({
      :include => :address
    }))
  end
end
