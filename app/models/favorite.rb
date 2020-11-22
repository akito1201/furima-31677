class Favorite < ApplicationRecord
  attr_accessor :checked
  belongs_to :user
  belongs_to :item
end
