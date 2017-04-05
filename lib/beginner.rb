require 'pry'
require_relative 'messages'
require_relative 'user'

class Beginner
  attr_accessor :beg_code
  attr_reader :guess_count, :playing_game

  def initialize
    @guess_count = 0
    @playing_game = true
    @user = User.new
    @beg_code = [1,2,3,4].map { ["r","g","b","y"].sample }
  end

  def current_game(guess = "")
    puts Messages.beginner_message
    guess = @user.user_input.chars
    if guess[0] == "q"
      @playing_game = false
    elsif guess[0] == "c"
      cheat_response(beg_code)
    else
      check_guess(guess)
    end
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
    beg_game_start
  end

  def beg_game_start
    while playing_game == true
      current_game
    end
  end

  # def find_positions_elements(guess, beg_code)
  #   positions = guess.zip(beg_code).count do | x |
  #               x[0] == x[1]
  #             end
  #   elements = guess.uniq.count do | x |
  #                 beg_code.include?(x)
  #             end
  # end

end
