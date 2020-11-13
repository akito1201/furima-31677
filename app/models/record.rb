class Record < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :time, presence: true
end
