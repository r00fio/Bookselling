require "rails_helper"

describe Book, :type => :model do

  it 'is invalid without name' do
    FactoryGirl.build(:book, title: nil).should_not be_valid
  end
  it 'is valid with name' do
    FactoryGirl.build(:book).should be_valid
  end
  it 'must save book' do
    FactoryGirl.create(:book)
    expect(Book.count).to eq 1
  end
end