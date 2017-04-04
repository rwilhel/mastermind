require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/beginner'

class BeginnerTest < MiniTest::Test

  def test_it_exists
    beginner = Beginner.new

    assert_instance_of Beginner, beginner
  end

  # def test_it_has_a_beginner_code
  #   beginner = Beginner.new
  #   result = beginner.beg_code
  #
  #   assert_equal true, result.include?("r")
  #   assert_equal true, result.include?("g")
  #   assert_equal true, result.include?("b")
  #   assert_equal true, result.include?("y")
  # end

  def test_it_is_random_code_each_time
    beginner = Beginner.new
    beginner2 = Beginner.new

    refute beginner.beg_code == beginner2.beg_code
  end

  def test_q_quits_the_game
    beginner = Beginner.new
    assert_equal true, beginner.playing_game
    beginner.current_game("q")
    refute beginner.playing_game == true
  end

  def test_c_gives_code
    skip
    beginner = Beginner.new
    beginner.current_game("c")
    beg_code = ["y", "r", "g", "b"]
    assert_equal "The secret code is yrgb.", beginner.cheat_response(beg_code)
  end

  def test_guess_can_win
    beginner = Beginner.new
    beginner.check_guess(beginner.beg_code)

    assert_equal false, beginner.playing_game
  end

  def test_guess_is_too_long
    beginner = Beginner.new
    beginner.check_guess(["y", "r", "b", "b", "g"])

    assert_equal true, beginner.playing_game
  end

  def test_guess_is_too_short
    beginner = Beginner.new
    beginner.check_guess(["y", "r", "b"])

    assert_equal true, beginner.playing_game
  end

  def test_guess_is_incorrect
    skip
    beginner = Beginner.new
    beginner.beg_code = ["y", "r", "g", "b"]
    guess = ["r", "r", "g", "b"]

    assert_equal "Wrong! Please guess again.", beginner.check_guess(guess)
  end
end
