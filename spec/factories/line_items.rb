FactoryGirl.define do

  factory :line_item do |f|

    f.product
    f.cart
    f.order
    f.quantity 1

    trait :many do
    	quantity 3
    end
  end
end