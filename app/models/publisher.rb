class Publisher < ActiveRecord::Base
  has_many :books
  validates :name, presence: true, length: {maximum: 255}
end
