# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
require 'fabrication'

lolcats = Category.find_or_create_by_name("LOLCats").id
classic = Category.find_or_create_by_name("Classic").id

25.times do
  Fabricate(:cat_picture, category_id: [lolcats, classic].sample)
end
