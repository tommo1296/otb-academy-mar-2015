class Basket
  attr_reader :price

  def initialize
    @price = 0.00
    @books = []
    @qtys = (0..4).map { 0 }
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

#make books a hash { :book_id => 1, :qty => 5 }