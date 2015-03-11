require 'book_shop.rb'

RSpec.describe "Harry potter shop" do

  let(:book_shop) { BookShop.new }

  context "when buying multple copies of the same book" do
  
    it "should give price for any 1 book" do
      book_shop.create_basket([1])
      expect(book_shop.basket).to eq(8.00)
    end

    it "should give price for multiple copies" do
      book_shop.create_basket((1..5).map { 1 }) #create 5 books of book 1
      expect(book_shop.basket).to eq(40.00)
    end

  end

end