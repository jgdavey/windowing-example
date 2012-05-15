class CatPicture < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :price
  belongs_to :category

  def self.cheapest_per_category
    find_by_sql <<-SQL
      SELECT DISTINCT ON(category_id) cat_pictures.*
      FROM cat_pictures
      WHERE ((category_id, price) IN (
        SELECT category_id, min(price)
        FROM cat_pictures
        GROUP BY category_id
      ))
      ORDER BY category_id ASC, cat_pictures.name ASC
    SQL
  end
end
