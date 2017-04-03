require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/messages'

module MessagesTest < MiniTest::Test

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

  def test_it_can_display_message_for_beg_level
    messages = Messages.new

    assert_equal "I have generated a beginner sequence with four elements made up of four colors: (r)ed, (g)reen, (b)lue and (y)ellow. Type (q)uit at any time to end the game. Get the secret code by typing (c)heat. What's your guess?", messages.beginner_message
  end

  def test_it_can_display_message_for_int_level
    messages = Messages.new

    assert_equal "I have generated an intermediate sequence with six elements made up of five colors: (r)ed, (g)reen, (b)lue, (p)urple and (y)ellow. Type (q)uit at any time to end the game. Get the secret code by typing (c)heat. What's your guess?", messages.intermediate_message
  end

  def test_it_can_display_message_for_adv_level
    messages = Messages.new

    assert_equal "I have generated an advanced sequence with eight elements made up of six colors (r)ed, (g)reen, (b)lue, (p)urple, (y)ellow and (w)hite. Type (q)uit at any time to end the game. Get the secret code by typing (c)heat. What's your guess?", messages.advanced_message
  end

  def test_it_can_display_instructions
    messages = Messages.new

    assert_equal "You need to guess the code that was chosen by the computer. Please enter (p)lay or (q)uit", messages.instructions_message
  end

  def test_it_can_display_quit_message
    messages = Messages.new

    assert_equal "Thanks for playing!", messages.quit_message
  end

  def test_it_can_display_length_error_messages
    messages = Messages.new

    assert_equal "Your guess is too long. :( Try again!", messages.long_guess_message
    assert_equal "Your guess is too short. :( Try again!", messages.short_guess_message
  end

  def test_it_can_display_correct_message
    skip
    messages = Messages.new
    guess = "rgby"
    guess_count = 6
    time = 245

    assert_equal "Congratulations! You guessed the sequence 'rgby' in 6 guesses over 4 min and 5 sec.", messages.correct_message(guess)
  end
end
