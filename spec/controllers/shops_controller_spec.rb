require 'rails_helper'
require 'database_cleaner'


describe ShopsController, :type => :controller do

  before(:each) do
    FactoryGirl.create(:shop)
  end

  describe "GET #show" do

    it 'should respond successfully with Http status = 200' do
      get :show, {:id => "1", :format => :json}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'should contain copies_in_stock = 0 ' do
      FactoryGirl.create(:book)
      expected = {
          shops: [
              {
                  :id => 1,
                  :name => "Ebay",
                  :books_sold_count => 1000000,
                  books_in_stock: [
                      {
                          :id => 1,
                          :title => "Book 1",
                          :copies_sold => 12,
                          :copies_in_stock => 0
                      }
                  ]
              }
          ]
      }.to_json
      get :show, {:id => "1", :format => :json}
      expect(response.body).to eq(expected)
    end
    it 'should not contain copies_in_stock = 0 ' do
      FactoryGirl.create(:book, copies_in_stock: 150)
      expected = {
          shops: [
              {
                  :id => 1,
                  :name => "Ebay",
                  :books_sold_count => 1000000,
                  books_in_stock: [
                      {
                          :id => 1,
                          :title => "Book 1",
                          :copies_sold => 12,
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