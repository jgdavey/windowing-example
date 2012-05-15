require 'faker'

Fabricator :cat_picture do
  name { Faker::Name.name }
  price { [22.99, 19.99, 9.99, 14.99].sample }
  description { Faker::Lorem.paragraph(2) }
end
