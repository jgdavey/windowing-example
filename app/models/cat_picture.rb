class CatPicture < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :price
  belongs_to :category

  def self.cheapest_per_category
    where("(category_id, price) IN (#{category_id_and_lowest_price_sql})").select("DISTINCT ON(category_id) #{table_name}.*").order("category_id ASC, #{table_name}.name ASC")
  end

  private
  def self.category_id_and_lowest_price_sql
    scoped.select("category_id, min(price)").group(:category_id).to_sql
  end
end
