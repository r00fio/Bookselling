require "rails_helper"

describe Shop, :type => :model do
  it 'is invalid without name' do
    FactoryGirl.build(:shop, name: nil).should_not be_valid
    end
  it 'is valid with name' do
    FactoryGirl.build(:shop).should be_valid
    end
  it 'must save shop' do
    FactoryGirl.create(:shop)
    expect(Shop.count).to eq 1
  end
end