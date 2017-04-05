require 'pry'
require_relative 'messages'
require_relative 'user'
# require './lib/mastermind'
# require './lib/runner'

class Beginner
  COLORS = ["r", "b", "g", "y"]

  attr_accessor :beg_code
  attr_reader :guess_count, :playing_game

  def initialize
    @guess_count = 0
    @playing_game = true
    @user = User.new
  end

  # def beg_game_setup
	#   4.times do
  #     @beg_code << COLORS.shuffle.pop
  # 	end
  # end

  def beg_code
    code = []
    4.times do
      code << COLORS.shuffle.pop
    end
    return code
  end

  def current_game(guess = "")
    answer = beg_code
    puts Messages.beginner_message
    guess = @user.user_input.chars
    while guess[0] != "q"
      if guess [0] == "c"
        cheat_response(answer)
        guess = @user.user_input.chars
      elsif
        check_guess(guess)
      end
    exit
    end
    # if guess[0] == "q"
    #   @playing_game = false
    # elsif guess[0] == "c"
    #   # cheat_response(beg_code)
    #   cheat_response(answer)
    # else
    #   check_guess(guess)
    # end
  end

  def check_guess(guess)
    if guess == beg_code
      print Messages.correct_message(guess)
      @playing_game = false
    elsif guess.count > 4
      print Messages.long_guess_message
      @playing_game = true
    elsif guess.count < 4
      print Messages.short_guess_message
      @playing_game = true
    else
      print Messages.incorrect_message
      @playing_game = true
    end
  end

  def cheat_response(beg_code)
    puts "The secret code is #{beg_code.join}."

    # beg_game_start
  end

  def beg_game_start
    while playing_game == true
      current_game
    end
  end

  def find_positions_elements(guess, beg_code)
    positions = guess.zip(beg_code).count do | x |
                x[0] == x[1]
              end
    elements = guess.uniq.count do | x |
                  beg_code.include?(x)
              end
  end

end
