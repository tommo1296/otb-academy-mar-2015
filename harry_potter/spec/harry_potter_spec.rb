require 'book_shop.rb'

RSpec.describe "Harry potter shop" do

  let(:book_shop) { BookShop.new }

  context "when buying multple copies of the same book"
  
    it "should give price for any 1 book" do
      book_shop.create_basket([1])
      expect(book_shop.basket).to eq(8.00)
    end

  end

end