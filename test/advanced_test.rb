require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/advanced'

class AdvancedTest < MiniTest::Test

  def test_it_exists
    advanced = Advanced.new

    assert_instance_of Advanced, advanced
  end

  def test_it_creates_advanced_code
    advanced = Advanced.new
    result = advanced.adv_code

    assert_equal true, result.any?{|color| color = "r", "g", "b", "y"}
  end

  def test_it_creates_random_code_each_time
    advanced = Advanced.new
    advanced2 = Advanced.new

    refute advanced.adv_code == advanced2.adv_code
  end

  def test_q_quits_the_game
    advanced = Advanced.new
    assert_equal true, advanced.playing_game
    advanced.current_game("q")
    assert_equal false, advanced.playing_game
  end

  def test_c_gives_cheat_code
    advanced = Advanced.new
    adv_code = ["y", "r", "g", "b", "p", "p", "w"]

    assert_equal "The secret code is yrgbppw.", advanced.cheat_response(adv_code)
  end

  def test_guess_can_win
    advanced = Advanced.new
    guess = ["y", "r", "b", "g", "p", "p", "w", "p"]

    assert_equal false, adv_game_win(["y", "r", "b", "g", "p", "p", "w", "p"]).playing_game
  end

  def test_guess_is_too_long
    advanced = Advanced.new
    guess = ["y", "r", "b", "g", "p", "p", "w", "p", "w"]

    assert_equal true, advanced.guess_long(guess)
  end

  def test_guess_is_too_short
    advanced = Advanced.new
    guess = ["y", "p", "g"]

    assert_equal true, advanced.guess_short(guess)
  end

  def test_guess_is_incorrect
    advanced = Advanced.new

    assert_equal true, advanced.playing_game
  end
end
