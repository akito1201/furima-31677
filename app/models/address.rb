class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :record
  belongs_to :region

  validates :region_id, presence: true, numericality: { other_than: 1, message: 'Select' }

  with_options presence: true do
    validates :zipcode
    validates :city
    validates :house
    validates :telephone
    validates :record
  end
end
