require 'pry'
require_relative 'beginner'
require_relative 'intermediate'
require_relative 'advanced'
require_relative 'messages'

class Runner

  def options(user)
    user_options = user.user_input
    if user_options == "b" || user_options == "beginner"
      Beginner.new.beg_game_start
    elsif user_options == "i" || user_options == "intermediate"
      Intermediate.new
    elsif user_options == "a" || user_options == "advanced"
      Advanced.new
    end
  end


  def run_the_files
    @mastermind = Mastermind.new
    binding.pry
    mastermind.game_start
  end


end

# Runner.new
