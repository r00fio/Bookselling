require 'rails_helper'
require 'database_cleaner'

describe PublishersController do

  before(:each) do
    FactoryGirl.create(:shop)
    FactoryGirl.create(:book)
    FactoryGirl.create(:publisher)

    FactoryGirl.create(:shop, :name => "Amazon", :id => 2)
    FactoryGirl.create(:book, :id => 2, :title => "Book 2",
                       :copies_in_stock => 230, :copies_sold => 34)
    FactoryGirl.create(:book, :id => 3, :title => "Book 3",
                       :copies_in_stock => 390, :copies_sold => 300,
                       :shop_id => 2)
    expect(Book.count).to eq(3)
    expect(Shop.count).to eq(2)
    expect(Publisher.count).to eq(1)
  end

  describe "GET #show" do

    it 'should respond successfully with Http status = 200' do
      get :show, {:id => "1", :format => :json}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'should contains shops only for specific publisher,
          books_sold_count is a sum of all books_in_stock
          for specific publisher
         shops should be ordered by books_sold_count' do

      expected = {
          shops: [
              {
                  :id => 2,
                  :name => "Amazon",
                  :books_sold_count => 300,
                  books_in_stock: [
                      {
                          :id => 3,
                          :title => "Book 3",
                          :copies_in_stock => 390
                      }
                  ]
              },
              {
                  :id => 1,
                  :name => "Ebay",
                  :books_sold_count => 46,
                  books_in_stock: [
                      {
                          :id => 1,
                          :title => "Book 1",
                          :copies_in_stock => 0
                      },
                      {
                          :id => 2,
                          :title => "Book 2",
                          :copies_in_stock => 230
                      }
                  ]
              }
          ]
      }.to_json

      get :show, {:id => "1", :format => :json}
      expect(response.body).to eq(expected)
    end

  end
end