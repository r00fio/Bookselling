json.shops @shops do |shop|
  json.(shop, :id, :name, :books_sold_count)
  json.books_in_stock shop.books do |book|
    json.(book, :id, :title, :copies_sold)
    if book.copies_in_stock == 0
      json.copies_in_stock book.copies_in_stock
    end
  end
end
