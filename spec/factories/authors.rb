require 'ffaker'
FactoryBot.define do
  factory :author do
    first_name {FFaker::Name.first_name}
    last_name {FFaker::Name.last_name}
    email {FFaker::Internet.email}
    year 2008
    available false
    section "MyString"
    shelf 1
    order 1
  end
end
