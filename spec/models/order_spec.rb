require 'spec_helper'

describe Order do

 	it "has a valid factory" do
		FactoryGirl.create(:order).should be_valid
	end
	it "is invalid without a name" do
		FactoryGirl.build(:order, name: nil).should_not be_valid
	end
	it "is invalid without address" do
		FactoryGirl.build(:order, address: nil).should_not be_valid
	end
	it "is invalid without email" do
		FactoryGirl.build(:order, email: nil).should_not be_valid
	end

	describe "validation pay_type" do
	it { should allow_value("Check").for(:pay_type) }
	it { should allow_value("Credit Card").for(:pay_type) }
	it { should allow_value("Purchase order").for(:pay_type) }
	end
	
	describe "Associations" do
      it { should have_many(:line_items).dependent(:destroy) }
    end


end
