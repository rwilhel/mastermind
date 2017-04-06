require 'pry'
require_relative 'messages'
require_relative 'runner'
require_relative 'user'

class Mastermind
  # attr_accessor :runner

  def initialize
    @user = User.new
    @runner = Runner.new
  end

  def play
    game_start
  end

  def game_start
    puts Messages.opening_message
    sleep(1)
    puts Messages.welcome_message
    start_menu_options(@user.user_input)
  end

  def start_menu_options(user_input)
    if user_input == "p" || user_input == "play"
      puts Messages.level_options_message
      @runner.options(@user)
    elsif user_input == "i" || user_input == "instructions"
      puts Messages.instructions_message
      sleep(1)
      puts Messages.welcome_message
      start_menu_options(user_input)
    elsif user_input == "q" || user_input == "quit"
      puts Messages.quit_message
      exit
    end
  end
end

Mastermind.new.play
