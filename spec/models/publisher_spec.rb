require "rails_helper"

describe Publisher do

  it 'is invalid without name' do
    FactoryGirl.build(:publisher, name: nil).should_not be_valid
  end
  it 'is valid with name' do
    FactoryGirl.build(:publisher).should be_valid
  end
  it 'must save shop' do
    FactoryGirl.create(:publisher)
    expect(Publisher.count).to eq 1
  end
end