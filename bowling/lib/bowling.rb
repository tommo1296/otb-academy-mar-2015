class Bowling

  def initialize
    @max_frames = 10
    @score = 0
    @frame_index = 0
  end

  def score(rolls)
    @rolls = rolls
    score = 0
    @frames = frames

    @frames.each do |frame|
      score += frame.score
    end
    return score
  end

  def frames
    frames = []
    frame = Frame.new

    @rolls.each_with_index do |item, index|

      unless last_frame_complete

        frame.add_to_frame(item, bonus_rolls(index))

        if frame.full?
          @frame_index += 1
          frames << frame
          frame = Frame.new
        end
      end
    end
    return frames
  end

  private

    def last_frame_complete
      @frame_index == @max_frames
    end

    def bonus_rolls(current_index)
      @rolls.slice(current_index+1, 2)
    end
end

class Frame
  attr_accessor :rolls, :bonus_rolls

  def initialize()
    @frame_full = false
    @roll = 0
    @rolls = []
    @bonus_rolls = []
  end

  def add_to_frame(roll, bonus_rolls)

    @rolls << roll
    @roll += 1

    if strike_frame?
      @bonus_rolls = bonus_rolls
      @frame_full = true
    elsif spare_frame?
      @bonus_rolls << bonus_rolls.first
      @frame_full = true
    end

  end

  def score
    score = 0
    @rolls.each { |r| score += r }
    @bonus_rolls.each { |b| score += b }
    return score
  end

  def full?
    @frame_full || @roll == 2
  end

  def strike_frame?
    @rolls[0] == 10
  end

  def spare_frame?
    score == 10
  end

end