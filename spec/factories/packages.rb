# spec/factories/packages.rb

FactoryBot.define do
  factory :package do
    sequence(:name) { |n| "Package #{n}" }
    description { 'Package description' }
    image { 'https://example.com/image.jpg' }
    package_type do
      [
        { name: 'Golden', price: 1000, description: '3 day 4 nights' },
        { name: 'Silver', price: 500, description: '2 day 3 nights' },
        { name: 'Platinum', price: 2000, description: '7 days 7 nights' }
      ]
    end
    user_id { 2 } # Change user_id as required
    created_at { Time.now }
    updated_at { Time.now }
  end
end
