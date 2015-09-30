class PublishersController < ApplicationController
  before_action only: [:show]

  # GET /publishers/1
  # GET /publishers/1.json
  def show
    @shops = Shop.includes(:books).where(books: {publisher_id: params[:id]})
    @shops = @shops.map { |shop|
      shop.books_sold_count = 0
      shop.books.each { |book|
        shop.books_sold_count += book.copies_sold
      }
      shop.books_sold_count > 0 ? shop : nil
    }.compact.sort_by { |shop|
      shop.books_sold_count
    }.reverse
  end
end
