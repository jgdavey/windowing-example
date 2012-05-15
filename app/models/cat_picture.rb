class CatPicture < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :price
  belongs_to :category

  def self.cheapest_per_category
    where("(#{table_name}.id, 1) IN (#{price_rank_sql})").order(:category_id)
  end

  private
  def self.price_rank_sql
    scoped.select("id, row_number() OVER (PARTITION BY category_id ORDER BY price ASC, name ASC)").to_sql
  end
end
