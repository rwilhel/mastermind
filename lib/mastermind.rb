require 'pry'
require './lib/messages'
require './lib/runner'

class Mastermind
  attr_reader :guess, :beg_code

  def initialize
    @guess = guess
    @beg_code = beg_code
  end

  def game_start
    puts Messages.opening_message
    sleep(2)
    puts Messages.welcome_message
  end

  def initial_user_input

  def start_menu_options
    if user_input == "p" || user_input == "play"
      level_options
    elsif user_input == "i" || user_input == "instructions"
      puts Messages.instructions_message
      sleep(2)
      puts Messages.welcome_message
    elsif user_input == "q" || user_input == "quit"
      puts Messages.quit_message
      exit
    end
  end

  def level_options
    if level_input == "b" || user_input == "beginner"
      beginner
    elsif level_input == "i" || user_input == "intermediate"
      intermediate
    elsif level_input == "a" || user_input == "advanced"
      advanced
    end
  end

  def beg_game_setup
    puts Messages.beginner_message
    beg_code = %w{r r r r g g g g b b b b y y y y}.sample(4)
    play_game(beg_code)
  end

  def beg_game_play
    if guess.join == "c" || guess.join == "cheat"
      puts Messages.cheat_message
      play_game(beg_code)
    elsif guess.join == "q" || guess.join == "quit"
      puts Messages.quit_message
      exit
    elsif guess.length > 4
      puts Messages.long_guess_message
      play_game(beg_code)
    elsif guess.length < 4
      puts Messages.short_guess_message
      play_game(beg_code)
    else
      find_code_match(guess, beg_code)
    end
  end

  def check_letters_for_code_match(guess, beg_code)
    if guess == beg_code
      puts Messages.correct_message
      exit
    end
    positions = guess.zip(beg_code).count do | x |
                x[0] == x[1]
              end
    elements = guess.uniq.count do | x |
                  beg_code.include?(x)
              end
    puts Messages.incorrect_message
    play_game(beg_code)
  end
end
