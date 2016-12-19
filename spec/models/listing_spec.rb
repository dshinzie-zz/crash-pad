require 'rails_helper'

describe Listing do
  describe "validations" do
    context "valid attributes" do
      it { should validate_presence_of(:description) }
      it { should validate_presence_of(:price) }
      it { should validate_presence_of(:accomodation) }
    end

    context "invalid attributes" do
      it "is invalid without accomdation" do
        listing = Listing.new(description: "test", price: 1.00)
        expect(listing).to be_invalid
      end

      it "is invalid without price" do
        listing = Listing.new(description: "test", accomodation: 10)
        expect(listing).to be_invalid
      end

      it "is invalid without description" do
        listing = Listing.new(accomodation: 10, price: 1.00)
        expect(listing).to be_invalid
      end
    end
  end

  describe "relationships" do
    it { should belong_to(:user) }
    it { should have_many(:reviews) }
    it { should have_many(:nights) }
  end

  describe "methods" do
    context '#create_nights' do
      it "creates nights for a range" do
        listing = create(:listing, start_date: '1/1/2017', end_date: '3/1/2017')
        listing.create_nights(listing.start_date, listing.end_date)

        expect(listing.nights.first.date).to eq(Date.parse(listing.start_date))
        expect(listing.nights.last.date).to eq(Date.parse(listing.end_date))
        expect(listing.nights.count).to eq(3)
      end
      it "creates" do

      end
    end
  end

end
