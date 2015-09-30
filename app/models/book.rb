class Book < ActiveRecord::Base
  belongs_to :publisher
  belongs_to :shop
  validates :title, length: {maximum: 255}, presence: true
end
