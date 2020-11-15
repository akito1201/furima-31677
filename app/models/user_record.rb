class UserRecord
  include ActiveModel::Model
  attr_accessor :zipcode, :region_id, :city, :house, :building, :telephone, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :zipcode
    validates :city
    validates :house
    validates :telephone
  end

  validates :region_id, numericality: { other_than: 1, message: 'Select' }

  def save

    record = Record.create(item_id: item_id, user_id: user_id)
    Address.create(zipcode: zipcode, region_id: region_id, city: city, house: house, building: building, telephone: telephone, record_id: record.id)
  end
end
