require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/beginner'

class BeginnerTest < MiniTest::Test

  def test_it_exists
    beginner = Beginner.new
    assert_instance_of Beginner, beginner
  end

end
