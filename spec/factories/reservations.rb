FactoryBot.define do
  factory :reservation do
    association :book
    email { "teller-test@email.com" }
    status { :reserved }
  end
end