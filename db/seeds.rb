Admin.create!(
  email: 'admin@example.com',
  password: 'adminadmin'
)

Category.create!(category_name: 'トップス')
Category.create!(category_name: 'ジャケット/アウター')
Category.create!(category_name: 'パンツ')
Category.create!(category_name: 'スカート')
Category.create!(category_name: 'ワンピース')
Category.create!(category_name: 'スーツ/ネクタイ')
Category.create!(category_name: 'バッグ')
Category.create!(category_name: 'シューズ')
Category.create!(category_name: 'ファッション雑貨')
Category.create!(category_name: 'その他')

100.times do |i|
  password = Faker::Internet.password(8)
  User.create!(name: Faker::Name.name,
               gender: rand(1..2),
               age: rand(20..50),
               email: "sample#{i}@example.com",
               password: password,
               password_confirmation: password
               )
end


