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
    @time_start = nil
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

  def position_compare(guess, adv_code)
     @position = guess.zip(adv_code).count { |pair| pair[0] == pair[1] }
  end

  def color_compare(guess, adv_code)
    correct_elements = []
    adv_code.each do |letter|
      if guess.include?(letter)
        correct_elements << letter
        guess.delete_at(guess.index(letter))
      end
    end
    @element = correct_elements.length
  end

  def check_guess(guess)
    if guess == adv_code
      adv_game_win(guess)
    elsif guess.count > 8
      track_guess
      print Messages.long_guess_message
      @playing_game = true
    elsif guess.count < 8
      track_guess
      print Messages.short_guess_message
      @playing_game = true
    else
      track_guess
      position_compare(guess, adv_code)
      color_compare(guess, adv_code)
      print Messages.incorrect_message(@element, @position, @guess_count)
      @playing_game = true
    end
  end

  def track_guess
    @guess_count += 1
  end

  def cheat_response(adv_code)
    puts "The secret code is #{adv_code.join}."
    adv_game_start
  end

  def adv_game_start
    while playing_game == true
      @time_start = Time.now
      current_game
    end
  end

  def adv_game_win(guess)
    time_end = (Time.now - @time_start)
    minutes = Time.at(time_end).utc.strftime("%M")
    seconds = Time.at(time_end).utc.strftime("%S")
    track_guess
    print Messages.correct_message(guess, guess_count, minutes, seconds)
    @playing_game = false
  end
end
