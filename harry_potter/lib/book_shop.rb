class BookShop
  attr_reader :basket

  def initialize
    @basket = Basket.new
  end

  def update_basket(items = [])
    items.each do |item|
      @basket.add_book(item)
    end
  end

end

class Basket
  attr_reader :sets, :price

  def initialize
    @sets = []
    @sets << []
    @discounts = [0, 0.05, 0.1, 0.2, 0.25]
  end

  def add_book(book_id)
    indexes = []

    #get a list of indexes where the book_id isnt present
    @sets.each_with_index do |set,index|
      if !set.include?(book_id)
        indexes << index
      end
    end

    #depending on what is returned then add 
    if indexes.empty?
      create_new_set(book_id)
    else
      index = indexes.first
      add_to_set(book_id, index)
    end

  end

  def price
    @price = 0 #price should be reset before this code is ran

    #run through each set and total the set
    iteration = 0
    @sets.each do |set|
      @price += set_price(set.count) - discount_amount(set.count)
      iteration += 1
    end
    @price
  end



    def discount_amount(number_of_books)
      discount = @discounts[number_of_books - 1]
      apply_discount = set_price(number_of_books) * discount
    end

    def set_price(number_of_books)
      number_of_books * 8.00
    end

    def add_to_set(book_id, index)
      @sets[index] << book_id
    end

    def create_new_set(book_id)
      new_set = []
      new_set << book_id
      @sets << new_set
    end

end