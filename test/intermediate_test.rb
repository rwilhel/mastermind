require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/intermediate'

class IntermediateTest < MiniTest::Test

  def test_it_exists
    intermediate = Intermediate.new

    assert_instance_of Intermediate, intermediate
  end

  def test_it_creates_intermediate_code
    intermediate = Intermediate.new
    result = intermediate.int_code

    assert_equal true, result.any?{|color| color = "r", "g", "b", "y"}
  end

  def test_it_creates_random_code_each_time
    intermediate = Intermediate.new
    intermediate2 = Intermediate.new

    refute intermediate.int_code == intermediate2.int_code
  end

  def test_q_quits_the_game
    intermediate = Intermediate.new
    assert_equal true, intermediate.playing_game
    intermediate.current_game("q")
    assert_equal false, intermediate.playing_game
  end

  def test_c_gives_cheat_code
    intermediate = Intermediate.new
    int_code = ["y", "r", "g", "b", "p", "p"]

    assert_equal "The secret code is yrgbpp.", intermediate.cheat_response(int_code)
  end

  def test_guess_can_win
    intermediate = Intermediate.
    guess = ["y", "r", "b", "g", "p", "p"]

    assert_equal false, int_game_win(["y", "r", "b", "g", "p", "p"]).playing_game
  end

  def test_guess_is_too_long
    intermediate = Intermediate.new
    guess = ["y", "r", "b", "g", "p", "p", "w"]

    assert_equal true, intermediate.guess_long(guess)
  end

  def test_guess_is_too_short
    intermediate = Intermediate.new
    guess = ["y", "p", "g"]

    assert_equal true, intermediate.guess_short(guess)
  end

  def test_guess_is_incorrect
    intermediate = Intermediate.new

    assert_equal true, intermediate.playing_game
  end
end
