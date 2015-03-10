
class BottleNumber

  def self.for(number_of_bottles)
    case number_of_bottles
    when 0 then BottleNumber0
    when 1 then BottleNumber1
    else
      BottleNumber
    end.new(number_of_bottles)
  end
  
  def initialize(number_of_bottles)
    @number_of_bottles = number_of_bottles
  end
  
  def pronoun
    "one"
  end
  
  def count_bottles
    @number_of_bottles.to_s
  end
  
  def container
    "bottles"
  end
  
  def action
    "Take #{pronoun} down and pass it around, "
  end
  
  def next_bottle_count
    @number_of_bottles - 1
  end
  
  def bottles_left_count
    BottleNumber.for(next_bottle_count).count_bottles
  end
  
  def bottles_left_container
    BottleNumber.for(next_bottle_count).container
  end
  
end

class BottleNumber0 < BottleNumber
  
  def next_bottle_count
    99
  end  

  def count_bottles
    "no more"
  end

  def action
    "Go to the store and buy some more, "
  end
end

class BottleNumber1 < BottleNumber
  def pronoun
    "it"
  end

  def container
    "bottle"
  end
end

class Bottles

  def verse(number_of_bottles)
    bottle_number = BottleNumber.for(number_of_bottles)
    "#{bottle_number.count_bottles.capitalize} #{bottle_number.container} of beer on the wall, "\
    "#{bottle_number.count_bottles} #{bottle_number.container} of beer.\n"\
    "#{bottle_number.action}"\
    "#{bottle_number.bottles_left_count} #{bottle_number.bottles_left_container} of beer on the wall.\n"
  end

  def verses(high, low )
    high.downto(low).map do |bottles|
      verse(bottles)
    end.join("\n") + "\n"
  end

  def sing
    verses(99, 0)
  end

end
