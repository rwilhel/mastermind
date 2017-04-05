require 'pry'
require_relative 'messages'
require_relative 'user'

class Intermediate
  attr_accessor :int_code
  attr_reader :guess_count, :playing_game

  def initialize
    @guess_count = 0
    @playing_game = true
    @user = User.new
    @int_code = [1,2,3,4,5,6].map { ["r","g","b","y","p"].sample }
  end

  def current_game(guess = "")
    puts Messages.intermediate_message
    guess = @user.user_input.chars
    if guess[0] == "q"
      @playing_game = false
    elsif guess[0] == "c"
      cheat_response(int_code)
    else
      check_guess(guess)
    end
  end

  def check_guess(guess)
    if guess == int_code
      print Messages.correct_message(guess)
      @playing_game = false
    elsif guess.count > 6
      print Messages.long_guess_message
      @playing_game = true
    elsif guess.count < 6
      print Messages.short_guess_message
      @playing_game = true
    else
      print Messages.incorrect_message
      @playing_game = true
    end
  end

  def cheat_response(int_code)
    puts "The secret code is #{int_code.join}."
    int_game_start
  end

  def int_game_start
    while playing_game == true
      current_game
    end
  end

  def find_positions_elements(guess, int_code)
    positions = guess.zip(int_code).count do | x |
                x[0] == x[1]
              end
    elements = guess.uniq.count do | x |
                  int_code.include?(x)
              end
  end

end
