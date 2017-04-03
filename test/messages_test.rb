require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/messages'

class MessagesTest < MiniTest::Test

  def test_it_exists
    messages = Messages.new
    assert_instance_of Messages, messages
  end

  def test_it_can_display_opening_message
    messages = Messages.new
    assert_equal "

       ┏(-_-)┛┗(-_- )┓┗(-_-)┛┏(-_-)┓┏(-_-)┛┗(-_- )┓┗(-_-)┛┏(-_-)┓┏(-_-)┛┗(-_- )┓┗(-_-)┛
          M      M      A    SSSSS  TTTTT  EEEEE  RRRRR  M     M  IIIII  N   N  DDDD
          M M  M M     A A   S        T    E      R   R  M M M M    I    NN  N  D   D
          M M  M M    A   A   SSS     T    EEEEE  RRRR   M M M M    I    NN  N  D   D
          M   M  M    AAAAA      S    T    E      R   R  M  M  M    I    N N N  D   D
          M   M  M   A     A SSSSS    T    EEEEE  R   R  M  M  M  IIIII  N  NN  D DD
       ┏(-_-)┛┗(-_- )┓┗(-_-)┛┏(-_-)┓┏(-_-)┛┗(-_- )┓┗(-_-)┛┏(-_-)┓┏(-_-)┛┗(-_- )┓┗(-_-)┛


    ", messages.opening_message
  end

  def test_it_can_display_welcome_message
    messages = Messages.new

    assert_equal "Welcome to MASTERMIND! Would you like to (p)lay, read the (i)nstructions, or (q)uit? >", messages.welcome_message
  end

  def test_it_can_ask_user_for_a_level
    messages = Messages.new

    assert_equal "Would you like to play the (b)eginner level for 4 positions, (i)ntermediate level for 6 positions or (a)dvanced level for 8 positions? >", messages.level_options_message
  end

  def test_it_can_display_message_for_chosen_level
    skip
    messages = Messages.new
    level = :beginner

    assert_equal "I have generated an intermediate sequence with six elements made up of five colors: (r)ed, (g)reen, (b)lue, (p)urple and (y)ellow. Type (q)uit at any time to end the game. What's your guess?", messages.level_options_message(level)
  end

  def test_it_can_display_message_for_input_p
    messages = Messages.new
    user_input == "p"
    assert_equal   "I have generated a beginner sequence with four elements made up of four colors: (r)ed, (g)reen, (b)lue and (y)ellow. Type (q)uit at any time to end the game. What's your guess?", messages.start_play_message(user_input)
  end
end
