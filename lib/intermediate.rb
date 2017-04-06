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
    @time_start = nil
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

  def position_compare(guess, int_code)
     @position = guess.zip(int_code).count { |pair| pair[0] == pair[1] }
  end

  def color_compare(guess, int_code)
    correct_elements = []
    int_code.each do |letter|
      if guess.include?(letter)
        correct_elements << letter
        guess.delete_at(guess.index(letter))
      end
    end
    @element = correct_elements.length
  end

  def check_guess(guess)
    if guess == int_code
      int_game_win(guess)
    elsif guess.count > 6
      track_guess
      print Messages.long_guess_message
      @playing_game = true
    elsif guess.count < 6
      track_guess
      print Messages.short_guess_message
      @playing_game = true
    else
      track_guess
      position_compare(guess, int_code)
      color_compare(guess, int_code)
      print Messages.incorrect_message(@element, @position, @guess_count)
      @playing_game = true
    end
  end

  def track_guess
    @guess_count += 1
  end

  def cheat_response(int_code)
    puts "The secret code is #{int_code.join}."
    int_game_start
  end

  def int_game_start
    while playing_game == true
      @time_start = Time.now
      current_game
    end
  end

  def int_game_win(guess)
    time_end = (Time.now - @time_start)
    minutes = Time.at(time_end).utc.strftime("%M")
    seconds = Time.at(time_end).utc.strftime("%S")
    track_guess
    print Messages.correct_message(guess, guess_count, minutes, seconds)
    @playing_game = false
  end
end
