FactoryGirl.define do
  factory :book do |f|
    f.id 1
    f.title "Book 1"
    f.copies_in_stock 0
    f.copies_sold 12
    f.publisher_id 1
    f.shop_id 1
  end
end