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
    skip
    mastermind = Mastermind.new
    user_input = "p"
    assert_equal true, mastermind.start_menu_options(user_input).include?("Would you like to play")
  end
end
