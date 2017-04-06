require 'pry'
require_relative 'beginner'
require_relative 'intermediate'
require_relative 'advanced'
require_relative 'messages'

class Runner

  attr_reader :user_options

  def options(user)
    user_options = user.user_input
    if user_options == "b" || user_options == "beginner"
      Beginner.new.beg_game_start
    elsif user_options == "i" || user_options == "intermediate"
      Intermediate.new.int_game_start
    elsif user_options == "a" || user_options == "advanced"
      Advanced.new.adv_game_start
    end
  end
end
