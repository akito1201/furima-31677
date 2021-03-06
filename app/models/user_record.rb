class UserRecord
  include ActiveModel::Model
  attr_accessor :zipcode, :region_id, :city, :house, :building, :telephone, :token, :item_id, :user_id

  with_options presence: true do
    validates :token
    validates :zipcode, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :region_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :house
    validates :telephone, format: { with: /\A\d{10}$|^\d{11}\z/ }
    validates :item_id
    validates :user_id
  end

  def save
    record = Record.create(item_id: item_id, user_id: user_id)
    Address.create(zipcode: zipcode, region_id: region_id, city: city, house: house, building: building, telephone: telephone, record_id: record.id)
  end
end
