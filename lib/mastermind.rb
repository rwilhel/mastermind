require 'pry'
require './lib/messages'
require './lib/runner'

class Mastermind
  attr_reader 

  def initialize
  end

  def game_start
    puts Messages.opening_message
    sleep(2)
    puts Messages.welcome_message
  end

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
end
