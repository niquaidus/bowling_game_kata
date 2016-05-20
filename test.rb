require 'minitest/autorun'
require 'minitest/reporters'
require './game'

reporter_options = {color: true}
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]



class TestFoo < Minitest::Test
  def setup
    @foo = Foo.new
  end
  
  def test_title_is_tree
   assert_equal "tree", @foo.title
  end
end