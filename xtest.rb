require 'minitest/autorun'
require 'minitest/reporters'
require './game'

reporter_options = {color: true}
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]


class TestGame < Minitest::Test
  def setup
      @game = Game.new
    end

  def test_10_strikes
    (0..8).each do |frame|
      @game.add_roll(10)
    end
    @game.add_roll(10)      
    @game.add_roll(5)
    @game.add_roll(0)

    assert_equal(280, @game.score, "10 strikes and a 5 & 0 wrong")
  end
  
end 
