require 'pry'
require './lib/messages'
require './lib/mastermind'
require './lib/runner'

class Beginner < Runner

  attr_reader :beg_code, :guess_count, :playing_game

  def initialize
    @guess_count = 0
    @playing_game = true
    beg_game_setup
  end

  def beg_game_setup
    puts Messages.new.beginner_message
    @beg_code = %w(r g b y).sample(4)
    # beg_game_play(beg_code)
  end

  def player_input(guess)
    if guess == "q"
      @playing_game = false
    elsif guess == "c"
      cheat_response(beg_code)
      return beg_code
    end
  end

  def cheat_response(code)
    puts "The secret code is #{code.join}."
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

  def find_code_match(guess, beg_code)
    if guess == beg_code
      puts Messages.correct_message
      exit
    else
      puts Messages.incorrect_message
      beg_game_play(beg_code)
    end
    positions = guess.zip(beg_code).count do | x |
                x[0] == x[1]
              end
    elements = guess.uniq.count do | x |
                  beg_code.include?(x)
              end
  end
end
