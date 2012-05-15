class CreateCatPictures < ActiveRecord::Migration
  def change
    create_table :cat_pictures do |t|
      t.integer :category_id
      t.decimal :price
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
