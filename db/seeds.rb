5.times do |n|
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    gender = Faker::Gender.binary_type
    birthday = Faker::Date.birthday(min_age: 18, max_age: 65)
    Author.create!(first_name:  first_name,
                   last_name:  last_name,
                   gender: gender,
                   birthday: birthday)
end