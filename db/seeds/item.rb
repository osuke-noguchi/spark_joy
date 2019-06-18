200.times do
  Item.create!(user_id: rand(1..30),
               image: open("#{Rails.root}/db/fixtures/sample.jpg"),
               size: 'true',
               category_id: [*1..10].sample,
               brand: Faker::Food.fruits,
               price: [1000,2000,3000].sample,
               purchase_day: Faker::Date.between(20.days.ago, Date.today),
               memo: nil
               )
end

