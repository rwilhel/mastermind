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

  # def initialize(level)
  #   @difficulty = level
  # end
  #
  # def length_for_difficulty
  #   {:beginner     => 4,
  #    :intermediate => 6,
  #    :advanced       => 8}
  # end
  #
  # def length
  #   length_for_difficulty[difficulty]
  # end
  #
  # def colors(level)
  #   case
  #     when level == :beginner then %w(R G B Y)
  #     when level == :intermediate then %w(P R G B Y)
  #     when level == :advanced then %w(T P R G B Y)
  #   end
  # end
  #
  # def sequence
  #   (0...length).collect{ colors(@difficulty).sample }
  # end
  #
  # end
  # 
  #
  #   def run_the_files
  #     @mastermind = Mastermind.new
  #     binding.pry
  #     mastermind.game_start
  #   end


end

# Runner.new
