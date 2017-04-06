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
    @time_start = nil
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

  def position_compare(guess, beg_code)
     @position = guess.zip(beg_code).count { |pair| pair[0] == pair[1] }
  end

  def color_compare(guess, beg_code)
    correct_elements = []
    beg_code.each do |letter|
      if guess.include?(letter)
        correct_elements << letter
        guess.delete_at(guess.index(letter))
      end
    end
    @element = correct_elements.length
  end

  def check_guess(guess)
    if guess == beg_code
      beg_game_win(guess)
    elsif guess.count > 4
      track_guess
      print Messages.long_guess_message
      @playing_game = true
    elsif guess.count < 4
      track_guess
      print Messages.short_guess_message
      @playing_game = true
    else
      track_guess
      position_compare(guess, beg_code)
      color_compare(guess, beg_code)
      print Messages.incorrect_message(@element, @position, @guess_count)
      @playing_game = true
    end
  end

  def track_guess
    @guess_count += 1
  end

  def cheat_response(beg_code)
    puts "The secret code is #{beg_code.join}."
    beg_game_start
  end

  def beg_game_start
    while playing_game == true
      @time_start = Time.now
      current_game
    end
  end

  def beg_game_win(guess)
    time_end = (Time.now - @time_start)
    minutes = Time.at(time_end).utc.strftime("%M")
    seconds = Time.at(time_end).utc.strftime("%S")
    track_guess
    print Messages.correct_message(guess, guess_count, minutes, seconds)
    @playing_game = false
  end
end
