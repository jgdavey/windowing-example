class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :cat_pictures
end
