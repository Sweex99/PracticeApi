task item_record: :environment do
  items = []
  5000.times do
    items << Item.create!(name: Faker::Commerce.product_name, department: Faker::Commerce.department(1, true), description: Faker::Lorem.sentence(1), cost: Faker::Commerce.price)
    puts "Success"
  end
  Item.import! items, on_duplicate_key_update: [:id]
end

