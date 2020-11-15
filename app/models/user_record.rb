class UserRecord
  include ActiveModel::Model
  attr_accessor :zipcode, :region_id, :city, :house, :building, :telephone, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :zipcode, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :house
    validates :telephone, format: {with: /\A\d{10,11}\z/ }
  end

  validates :region_id, numericality: { other_than: 1, message: 'Select' }

  def save

    record = Record.create(item_id: item_id, user_id: user_id)
    Address.create(zipcode: zipcode, region_id: region_id, city: city, house: house, building: building, telephone: telephone, record_id: record.id)
  end
end
