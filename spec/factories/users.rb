# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Lucas Ocon"
    provider "facebook"
    uid "12324"
    email "lucas_masterclas@hotmail.com"
    
  end
end
