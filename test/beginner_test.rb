require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/beginner'

class BeginnerTest < MiniTest::Test

  def test_it_exists
    beginner = Beginner.new
    assert_instance_of Beginner, beginner
  end

  def test_it_has_a_beginner_code
    beginner = Beginner.new
    result = beginner.beg_code

    assert_equal true, result.include?("r")
    assert_equal true, result.include?("g")
    assert_equal true, result.include?("b")
    assert_equal true, result.include?("y")
  end

  def test_it_is_random_code_each_time
    beginner = Beginner.new
    beginner2 = Beginner.new

    assert_equal false, beginner.beg_code == beginner2.beg_code
  end

  def test_q_quits_the_game
    beginner = Beginner.new
    assert_equal true, beginner.playing_game
    beginner.player_input("q")
    assert_equal false, beginner.playing_game
  end

  def test_c_gives_code
    beginner = Beginner.new
    test = beginner.player_input("c")
    assert_equal test, beginner.beg_code
  end

  def test_message_too_long
    
end
