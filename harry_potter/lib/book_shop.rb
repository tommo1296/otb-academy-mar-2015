class Basket
  attr_reader :price

  def initialize
    @price = 0.00
    @books = []
  end

  def add(book_id)
    @books << book_id
    @price += 8.00
  end

end

class BookShop
  attr_reader :basket

  def initialize
    @basket = Basket.new
  end

  def create_basket(items = [])
    items.each do |item|
      @basket.add(item)
    end
  end

end