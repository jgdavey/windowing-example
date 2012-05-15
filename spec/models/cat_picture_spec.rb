require 'spec_helper'

describe CatPicture do
  describe '.cheapest_per_category' do
    let!(:category2) { Fabricate(:category) }
    let!(:category1) { Fabricate(:category) }

    it "returns a list, with only the cheapest for its category" do
      pic1 = Fabricate(:cat_picture, price: 8.5,  category_id: category1.id)
      pic2 = Fabricate(:cat_picture, price: 12.5, category_id: category1.id)
      pic3 = Fabricate(:cat_picture, price: 4.5, category_id: category2.id)
      pic4 = Fabricate(:cat_picture, price: 9.5, category_id: category2.id)
      CatPicture.cheapest_per_category.should == [pic1, pic3]
    end

    context "when two pictures have the same price" do
      it "returns only the first one, when sorted by name" do
        pic1 = Fabricate(:cat_picture, price: 8.5,  category_id: category1.id)
        pic2 = Fabricate(:cat_picture, price: 12.5, category_id: category1.id)
        pic3 = Fabricate(:cat_picture, name: "Zeke", price: 4.5, category_id: category2.id)
        pic4 = Fabricate(:cat_picture, name: "Alex", price: 4.5, category_id: category2.id)
        CatPicture.cheapest_per_category.should == [pic1, pic4]
      end
    end
  end
end
