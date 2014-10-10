  require 'spec_helper'

describe Product do
	it "has a valid factory" do
		FactoryGirl.create(:product).should be_valid
	end
	it "is invalid without a title" do
		FactoryGirl.build(:product, title: nil).should_not be_valid
	end
	it "is invalid without description" do
		FactoryGirl.build(:product, description: nil).should_not be_valid
	end

	it "is invalid without image_url" do
		FactoryGirl.build(:product, image_url: nil).should_not be_valid
	end

	it "is invalid without price" do
		FactoryGirl.build(:product, price: nil).should_not be_valid
	end

	it "is a valid numeracility" do
		FactoryGirl.build(:product, price: 0.02).should be_valid
	end

	it "is invalid numeracility" do
		FactoryGirl.build(:product, price: "hola").should_not be_valid
	end

	it "have a unique title" do
		new = FactoryGirl.create(:product, title: "duplicated")
		FactoryGirl.build(:product, title: "duplicated").should_not be_valid
	end

	it "not have a duplicated title" do
		FactoryGirl.build(:product, title: "duplix").should be_valid
		new = FactoryGirl.create(:product, title: "dupli").should be_valid
	end

end