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

                        ███╗   ███╗ █████╗ ███████╗████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗██████╗
                        ████╗ ████║██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗
                        ██╔████╔██║███████║███████╗   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║██║  ██║
                        ██║╚██╔╝██║██╔══██║╚════██║   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██║  ██║
                        ██║ ╚═╝ ██║██║  ██║███████║   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██████╔╝
                        ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═════╝

                        ┏(-_-)┛┗(-_- )┓┗(-_-)┛┏(-_-)┓┏(-_-)┛┗(-_- )┓┗(-_-)┛┏(-_-)┓┏(-_-)┛┗(-_- )┓┗(-_-)┛


    ", Messages.opening_message
  end

  def test_it_can_display_welcome_message
    messages = Messages.new

    assert_equal "Welcome to MASTERMIND! Would you like to (p)lay, read the (i)nstructions, or (q)uit? >\n", Messages.welcome_message
  end

  def test_it_can_ask_user_for_a_level
    messages = Messages.new

    assert_equal "Would you like to play the (b)eginner level for 4 positions, (i)ntermediate level for 6 positions or (a)dvanced level for 8 positions? >\n", Messages.level_options_message
  end

  def test_it_can_display_message_for_beg_level
    messages = Messages.new

    assert_equal "I have generated a beginner sequence with four elements made up of four colors: (r)ed, (g)reen, (b)lue and (y)ellow. Type (q)uit at any time to end the game. Get the secret code by typing (c)heat. What's your guess?\n", Messages.beginner_message
  end

  def test_it_can_display_message_for_int_level
    messages = Messages.new

    assert_equal "I have generated an intermediate sequence with six elements made up of five colors: (r)ed, (g)reen, (b)lue, (p)urple and (y)ellow. Type (q)uit at any time to end the game. Get the secret code by typing (c)heat. What's your guess?\n", Messages.intermediate_message
  end

  def test_it_can_display_message_for_adv_level
    messages = Messages.new

    assert_equal "\nI have generated an advanced sequence with eight elements made up of six colors (r)ed, (g)reen, (b)lue, (p)urple, (y)ellow and (w)hite. Type (q)uit at any time to end the game. Get the secret code by typing (c)heat. What's your guess?\n", Messages.advanced_message
  end

  def test_it_can_display_instructions
    messages = Messages.new

    assert_equal "You need to guess the code that was chosen by the computer.\n", Messages.instructions_message
  end

  def test_it_can_display_quit_message
    messages = Messages.new

    assert_equal "Thanks for playing!\n", Messages.quit_message
  end

  def test_it_can_display_length_error_messages
    messages = Messages.new

    assert_equal "Your guess is too long. :( Try again!\n", Messages.long_guess_message
    assert_equal "Your guess is too short. :( Try again!\n", Messages.short_guess_message
  end

  def test_it_can_display_correct_message
    messages = Messages.new
    guess = ["r", "g", "b", "y"]
    guess_count = 6
    minutes = 1
    seconds = 15

    assert_equal "Congratulations! You guessed the sequence '#{guess.join}' in #{guess_count} guesses and it only took #{minutes} minute(s) and #{seconds} second(s).\n", Messages.correct_message(guess, guess_count, minutes, seconds)
  end
end
