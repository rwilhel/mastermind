class Intermediate
  attr_reader :int_code

  def initialize
    @int_code = int_code
  end

  def int_game_setup
    puts Messages.intermediate_message
    int_code = %w(r g b p y).sample(6)
    play_game(int_code)
  end

  def int_game_play
    if guess.join == "c" || guess.join == "cheat"
      puts "Wow. Are you serious? Hmmm... Ok, fine! The secret code is #{int_code.join}, ya cheater..."
      play_game(int_code)
    elsif guess.join == "q" || guess.join == "quit"
      puts Messages.quit_message
      exit
    elsif guess.length > 6
      puts Messages.long_guess_message
      play_game(int_code)
    elsif guess.length < 6
      puts Messages.short_guess_message
      play_game(int_code)
    else
      find_code_match(guess, int_code)
    end
  end

  def check_letters_for_code_match(guess, int_code)
    if guess == int_code
      puts Messages.correct_message
      exit
    end
    positions = guess.zip(int_code).count do | x |
                x[0] == x[1]
              end
    elements = guess.uniq.count do | x |
                  int_code.include?(x)
              end
    puts Messages.incorrect_message
    play_game(int_code)
  end
end
