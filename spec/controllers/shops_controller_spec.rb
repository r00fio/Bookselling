require 'rails_helper'

describe ShopsController, :type => :controller do
  describe "GET #show" do

    it 'should respond successfully with Http status = 200' do

      FactoryGirl.create(:shop)
      get :show, {:id => "1", :format => :json}
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'should contain copies_in_stock = 0 ' do

      FactoryGirl.create(:shop)
      FactoryGirl.create(:book)

      expect(Shop.count).to eq 1
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

      FactoryGirl.create(:shop)
      FactoryGirl.create(:book, copies_in_stock: 150)

      expect(Shop.count).to eq 1
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