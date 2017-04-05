require 'pry'
require_relative 'messages'
require_relative 'user'

class Advanced
  attr_accessor :adv_code
  attr_reader :guess_count, :playing_game

  def initialize
    @guess_count = 0
    @playing_game = true
    @user = User.new
    @adv_code = [1,2,3,4,5,6,7,8].map { ["r","g","b","y","p","w"].sample }
  end

  def current_game(guess = "")
    puts Messages.advanced_message
    guess = @user.user_input.chars
    if guess[0] == "q"
      @playing_game = false
    elsif guess[0] == "c"
      cheat_response(adv_code)
    else
      check_guess(guess)
    end
  end

  def check_guess(guess)
    if guess == adv_code
      print Messages.correct_message(guess)
      @playing_game = false
    elsif guess.count > 8
      print Messages.long_guess_message
      @playing_game = true
    elsif guess.count < 8
      print Messages.short_guess_message
      @playing_game = true
    else
      print Messages.incorrect_message
      @playing_game = true
    end
  end

  def cheat_response(adv_code)
    puts "The secret code is #{adv_code.join}."
    adv_game_start
  end

  def adv_game_start
    while playing_game == true
      current_game
    end
  end

  def find_positions_elements(guess, adv_code)
    positions = guess.zip(adv_code).count do | x |
                x[0] == x[1]
              end
    elements = guess.uniq.count do | x |
                  adv_code.include?(x)
              end
  end

end
