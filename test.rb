require 'minitest/autorun'
require 'minitest/reporters'
require './game'

reporter_options = {color: true}
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]



class TestGame < Minitest::Test
  def setup
      @game = Game.new
    end
  
  def test_game_object_can_be_instantiated
    assert_equal(@game.nil?, false, "game object not defined")
  end
  
  def test_20_rolls_of_0_is_0
    (1..20).each do |roll|
      @game.add_roll(0)
    end
    
    assert_equal(0, @game.score, "game score wrong for 0 pins")
  end
  
  def test_static_rolls_score_is_correct
    (0..9).each do |roll|
      (0..9).each do |frames|
        @game.add_roll(roll)
        @game.add_roll(0)
      end
      assert_equal(roll * 10, @game.score, "score is wrong first static test!")
      @game.reset
    end        
  end
  
  def test_inverse_static_rolls_test
    (0..9).each do |roll|
      (0..9).each do |frames|
        @game.add_roll(0)
        @game.add_roll(roll)
      end
      assert_equal(roll * 10, @game.score, "score is wrong second static test")
      @game.reset
    end
  end
  
  def test_various_non_strike_or_spare_rolls
    (1..9).each do |roll|
      (0..9).each do |frames|
        @game.add_roll(roll)
        @game.add_roll(9 - roll)
      end
      assert_equal(90, @game.score, "various non strike or apsre tests failed")
      @game.reset
    end
  end
  
  def test_one_spare
    @game.add_roll(5)
    @game.add_roll(5)
    @game.add_roll(5)
    @game.add_roll(0)
    (1..8).each do |roll|
      @game.add_roll(0)
      @game.add_roll(0)
    end

    assert_equal(20, @game.score, "simple spare and gutters wrong")
  end
  
  def test_9_spares
    (0..8).each do |frame|
      @game.add_roll(5)
      @game.add_roll(5)
    end  
    
    @game.add_roll(5)
    @game.add_roll(0)

    assert_equal(140, @game.score, "9 spares and a 5 wrong")
  end
  
  
  
    
end