class Shop < ActiveRecord::Base
  has_many :books
  validates :name, presence: true, length: {maximum: 255}
  def ordered_by_books_sold
    Shop.order()
  end
end
