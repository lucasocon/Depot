require 'spec_helper'

describe LineItem do

	it "has a valid factory" do
		FactoryGirl.create(:line_item).should be_valid
	end
	it "is invalid without product" do
    	FactoryGirl.build(:line_item, product: nil).should_not be_valid
  	end
	it "is invalid without product id" do
    	FactoryGirl.build(:line_item, product_id: nil).should_not be_valid
  	end

	describe "Associations" do
		it { should belong_to(:order) }
		it { should belong_to(:product) }
		it { should belong_to(:cart) }
	end

	describe "#total_price" do
		it "returns product price * quantity" do
			item = FactoryGirl.create(:line_item)
			item.total_price.should eq(item.product.price * item.quantity)
		end
	end

end