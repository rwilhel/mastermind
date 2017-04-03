class Beginner
  attr_reader :beg_code, :guess_count

  def initialize
    @beg_code = beg_code
    @guess_count = guess_count
  end

  def beg_game_setup
    puts Messages.beginner_message
    beg_code = %w(r g b y).sample(4)
    beg_game_game(beg_code)
  end

  def beg_game_play(beg_code)
    if guess.join == "c" || guess.join == "cheat"
      puts   puts "Wow. Are you serious? Hmmm... Ok, fine! The secret code is #{beg_code.join}, ya cheater..."
      beg_game_game(beg_code)
    elsif guess.join == "q" || guess.join == "quit"
      puts Messages.quit_message
      exit
    elsif guess.length > 4
      puts Messages.long_guess_message
      beg_game_game(beg_code)
    elsif guess.length < 4
      puts Messages.short_guess_message
      beg_game_game(beg_code)
    else
      find_code_match(guess, beg_code)
    end
  end

  def check_letters_for_code_match(guess, beg_code)
    if guess == beg_code
      puts Messages.correct_message
      exit
    end
    guess_count = guess.count
    positions = guess.zip(beg_code).count do | x |
                x[0] == x[1]
              end
    elements = guess.uniq.count do | x |
                  beg_code.include?(x)
              end
    puts Messages.incorrect_message
    beg_game_game(beg_code)
  end
end
