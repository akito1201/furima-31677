class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

   #アソシエーション
    belongs_to :category
    belongs_to :condition
    belongs_to :shipping
    belongs_to :region
    belongs_to :days
    belongs_to :user

   #バリデーション
    with_options presence: true do
      validates :name
      validates :description
    end

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :shipping_id
      validates :region_id
      validates :days_id
    end

end