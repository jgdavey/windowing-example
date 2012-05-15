class CatPicture < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :price
  belongs_to :category

  def self.cheapest_per_category
    all.group_by(&:category_id).map do |category_id, subset|
      subset.sort_by { |pic| [pic.price, pic.name] }.first
    end.compact
  end
end
