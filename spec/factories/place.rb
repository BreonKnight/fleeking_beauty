FactoryGirl.define do
  factory :place do
    name { FFaker::AddressFR.city }
    lat '35.6833'
    lon '139.7667'
  end
end