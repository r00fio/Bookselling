json.array!(@books) do |book|
  json.extract! book, :id, :title, :copies_sold, :copies_in_stock
  json.url book_url(book, format: :json)
end
