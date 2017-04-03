require 'pry'
require './lib/messages'

class MastermindTest

  def initialize
  end

  def game_start
    puts Messages.opening_message
    sleep(2)
    puts Messages.welcome_message
  end

  def start_menu_options
    loop do
    user_input = gets.chomp.downcase
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

  def level_options_message
    puts Messages.level_options_message
    loop do
    level_input = gets.chomp.downcase
    if level_input == "b" || user_input == "beginner"
      beginner
    elsif level_input == "i" || user_input == "intermediate"
      intermediate
    elsif level_input == "a" || user_input == "advanced"
      advanced
    end
  end

  def beginner_game
    puts Messages.beginner_message
    key = %w{r r r r g g g g b b b b y y y y}.sample(4)
    play_game(key)

end
