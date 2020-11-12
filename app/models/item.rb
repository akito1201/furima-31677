class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

   #アソシエーション
    has_one_attached :image

    belongs_to :category
    belongs_to :condition
    belongs_to :shipping
    belongs_to :region
    belongs_to :delivery
    belongs_to :user

   #バリデーション
    with_options presence: true do
      validates :name
      validates :description
      validates :image
    end

      validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: "Half-width number"},
                :numericality => {
                          :greater_than_or_equal_to => 300,
                          :less_than_or_equal_to => 999999,
                          message: " Out of setting range"
                          }
  

    with_options presence: true, numericality: { other_than: 1, message: "Select" } do
      validates :category_id
      validates :condition_id
      validates :shipping_id
      validates :region_id
      validates :delivery_id
    end

end