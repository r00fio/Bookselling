json.array!(@shops) do |shop|
  json.extract! shop, :id, :name, :books_sold_count
  json.url shop_url(shop, format: :json)
end
