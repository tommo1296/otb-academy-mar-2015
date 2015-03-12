class Basket

  def initialize
    @price = 0.00
    @books = []
    @qtys = [0,0,0,0,0]
  end

  def add(book_id)
    @books << book_id
    update_quantity(book_id)
  end

  def price
    @price = @qtys.reduce(:+) * 8.00

    

    return @price
  end

  private

    def update_quantity(book_id)
      @qtys[book_id - 1] += 1
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
