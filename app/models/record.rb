class Record < ApplicationRecord
  attr_accessor :token

  belongs_to :user
  belongs_to :item
  belongs_to :address

  validates :time, presence: true
  validates :token, presence: true
end
