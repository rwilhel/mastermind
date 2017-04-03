require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'

class MastermindTest < MiniTest::Test

  def test_it_exists
    mastermind = Mastermind.new

    assert_instance_of Mastermind, mastermind
  end

  def test_p_input_goes_to_level_options
    mastermind = Mastermind.new
    user_input = "p"
    assert_equal user_input
  end
end
