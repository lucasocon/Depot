FactoryGirl.define do

  factory :order do |f|

    f.name "Order"
    f.address "my address 1234"
    f.email "my@order.com"
    f.pay_type "Check"
    
  end
end
