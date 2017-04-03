require 'pry'
require_relative 'messages'
require_relative 'user'
# require './lib/mastermind'
# require './lib/runner'

class Beginner

  attr_reader :beg_code, :guess_count, :playing_game

  def initialize
    @guess_count = 0
    @playing_game = true
    @user = User.new
    @beg_code = %w(r g b y).sample(4)
  end

  def current_game(guess = "")
    puts Messages.beginner_message
    guess = @user.user_input.chars
    if guess[0] == "q"
      @playing_game = false
    elsif guess[0] == "c"
      cheat_response(beg_code)
      return beg_code
    else
      check_guess(guess)
    end
  end

  def check_guess(guess)
    if guess == beg_code
      puts Messages.correct_message(guess)
      @playing_game = false
    elsif guess.count > 4
      puts Messages.long_guess_message
      # current_game
    elsif guess.count < 4
      puts Messages.short_guess_message
      # current_game
    else
      puts Messages.incorrect_message
      # current_game
    end
  end

  def cheat_response(code)
    puts "The secret code is #{code.join}."
    beg_game_play
  end

  def beg_game_start
    while playing_game == true
      current_game
    end
  end

  def long_guess
    if guess > 4
    end
  end

  def find_code_match(guess, beg_code)
    if guess == beg_code

    else

    end

  # def beg_game_play(beg_code)
  #   if guess.join == "c" || guess.join == "cheat"
  #     puts "Wow. Are you serious? Hmmm... Ok, fine! , ya cheater..."
  #     beg_game_play(beg_code)
  #   elsif guess.join == "q" || guess.join == "quit"
  #     puts Messages.quit_message
  #     exit
  #   elsif guess.length > 4
  #     puts Messages.long_guess_message
  #     beg_game_play(beg_code)
  #   elsif guess.length < 4
  #     puts Messages.short_guess_message
  #     beg_game_play(beg_code)
  #   else
  #     guess_count += 1
  #     find_code_match(guess, beg_code)
  #   end
  # end


    positions = guess.zip(beg_code).count do | x |
                x[0] == x[1]
              end
    elements = guess.uniq.count do | x |
                  beg_code.include?(x)
              end
  end
end
