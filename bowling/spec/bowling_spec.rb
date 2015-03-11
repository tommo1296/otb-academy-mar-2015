require 'bowling.rb'

RSpec.describe "A game of bowling" do

  describe "can score" do

    let(:bowling) { Bowling.new }

    it "can score the worst game ever" do
      rolls = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
      expect(bowling.score(rolls)).to eql(0)
    end

    it "can score a perfect game" do
      rolls = [10,10,10,10,10,10,10,10,10,10,10,10]
      expect(bowling.score(rolls)).to eql(300)
    end

    it "can score a game where no spares or strikes are hit" do
      rolls = [1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2]
      expect(bowling.score(rolls)).to eql(30)
    end

    it "can score a game with the odd spare" do
      rolls = [5,5,1,2,1,2,1,2,1,2,5,5,1,2,1,2,1,2,1,2]
      expect(bowling.score(rolls)).to eql(46)
    end

    it "can score with the last game as a spare" do
      rolls = [1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,5,5,5]
      expect(bowling.score(rolls)).to eql(42)
    end

    it "can score with the odd strike" do
      rolls = [10,1,2,1,2,1,2,1,2,10,1,2,1,2,10,1,2]
      expect(bowling.score(rolls)).to eql(60)
    end

    it "can score with the last frame as all strikes" do
      rolls = [1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,10,10,10]
      expect(bowling.score(rolls)).to eql(57)
    end

    it "can score with 1 strike on the last frame" do
      rolls = [1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,10,1,2]
      expect(bowling.score(rolls)).to eql(40)
    end

  end

end