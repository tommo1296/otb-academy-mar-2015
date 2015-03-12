require 'book_shop.rb'

RSpec.describe "Harry potter shop" do

  let(:book_shop) { BookShop.new }

  context "when buying multple copies of the same book" do
  
    it "should give price for any 1 book" do
      book_shop.create_basket([1])
      expect(book_shop.basket.price).to eq(8.00)
    end

    it "should give price for multiple copies" do
      book_shop.create_basket((1..5).map { 1 }) #create 5 books of book 1
      expect(book_shop.basket.price).to eq(40.00)
    end

    it "should cost the same for any" do
      book_shop.create_basket((1..5).map { 5 }) #create 5 books of book 5
      expect(book_shop.basket.price).to eq(40.00)
    end

  end

  context "when buying different books" do

    it "should discount 2 books" do
      book_shop.create_basket((1..2).map { |i| i })
      expect(book_shop.basket.price).to eq(15.20)
    end

    it "should discount 3 books" do
      book_shop.create_basket((1..3).map { |i| i })
      expect(book_shop.basket.price).to eq(21.60)
    end

    it "should discount 4 books" do
      book_shop.create_basket((1..4).map { |i| i })
      expect(book_shop.basket.price).to eq(25.60)
    end

    it "should discount 5 books" do
      book_shop.create_basket((1..5).map { |i| i })
      expect(book_shop.basket.price).to eq(30.00)
    end

  end

end