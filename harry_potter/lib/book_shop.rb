class BookShop

  def initialize
    @basket = 0
  end

  def create_basket(items = [])
    @basket_items = items
  end

  def basket
    @basket_items.each do |item|
      @basket += 8.00
    end
    return @basket
  end

end