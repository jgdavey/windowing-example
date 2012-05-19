class CatPicture < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :price
  belongs_to :category

  def self.cheapest_per_category
    inner = <<-SQL
      SELECT category_id, min(name), min(price)
      FROM cat_pictures
      WHERE ((category_id, price) IN (
        SELECT category_id, min(price)
        FROM cat_pictures
        GROUP BY category_id
      ))
      GROUP BY category_id
    SQL
    where("(category_id, name, price) IN (#{inner})")
  end
end
