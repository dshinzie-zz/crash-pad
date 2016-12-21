require 'rails_helper'

describe Night do
  describe "validations" do
    context "valid attributes" do
      it { should validate_presence_of(:date) }
    end
  end

  describe "relationships" do
    it { should belong_to(:listing) }
    it { should belong_to(:booking) }
  end

end
