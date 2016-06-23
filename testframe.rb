require 'minitest/autorun'
require 'minitest/reporters'
require './frame'

reporter_options = {color: true}
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]


class TestFrame < Minitest::Test
  def setup
     @frame = Frame.new
  end

  def test_frame_object_can_be_instantiated
    assert_equal(@frame.nil?, false, "frame object not defined")
  end
  
  describe "test_complete?" do #a group of tests to test if a frame is complete 
    def setup
       @frame = Frame.new
    end

    def test_complete_no_rolls
      assert_equal(@frame.complete?, false, "frame complete wrong with no rolls")
    end

    def test_complete_one_roll
      @frame.add_roll(0)
      assert_equal(@frame.complete?, false, "frame complete wrong with one roll")
    end

    def test_complete_two_rolls
      @frame.add_roll(0)
      @frame.add_roll(0)
      assert_equal(@frame.complete?, true, "frame complete wrong with two rolls")
    end
    
    def test_complete_strike_non_tenth
      @frame.add_roll(10)
      assert_equal(@frame.complete?, true, "frame complete strike non-tenth frame")
    end

    def test_complete_spare_frame_ten
      @frame.add_roll(5)
      @frame.add_roll(5)
      assert_equal(@frame.complete?(true), false, "frame complete wrong with spare in tenth frame")
    end
  
    def test_complete_two_strikes_frame_ten # two strikes only in the last frame
      @frame.add_roll(10)
      @frame.add_roll(10)
      assert_equal(@frame.complete?(true), false, "frame complete wrong with two strikes in tenth frame")
    end

    def test_complete_one_strike_one_roll_frame_ten
      @frame.add_roll(10)
      @frame.add_roll(0)
      assert_equal(@frame.complete?(true), false, "frame complete wrong with one strike & one roll")
    end

    def test_complete_three_strikes_frame_ten 
      @frame.add_roll(10)
      @frame.add_roll(10)
      @frame.add_roll(10)
      assert_equal(@frame.complete?(true), true, "frame complete wrong with three strikes in tenth frame")
    end

  end # end of describe for complete

  def test_frame_is_strike
    assert_equal(@frame.strike?, false, "strike test failed: no rolls")
    @frame.add_roll(10)
    assert_equal(@frame.strike?, true, "strike test failed: strike!")
  end

  def test_frame_is_spare
    assert_equal(@frame.spare?, false, "spare test failed: no rolls")
    @frame.add_roll(5)
    assert_equal(@frame.spare?, false, "spare test failed: one roll")
    @frame.add_roll(5)
    assert_equal(@frame.spare?, true, "spare test failed: spare!")
  end

end
