class Bowling

  def score(rolls)
    score = 0
    @frames = frames(rolls)

    @frames.each do |frame|
      score += frame.score
    end
    return score
  end

  def frames(rolls)
    @max_frames = 10
    @frame_index = 0
    frames = []
    frame = Frame.new

    rolls.each_with_index do |item, index|

      unless last_frame_complete

        bonus_rolls = rolls.slice(index+1, 2)

        frame.add_to_frame(item, bonus_rolls)

        if frame.full?
          @frame_index += 1
          frames << frame
          frame = Frame.new
        end
      end
    end
    return frames
  end

  def last_frame_complete
    @frame_index == @max_frames
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