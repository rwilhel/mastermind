class Beginner

  def beg_game_setup
    puts Messages.beginner_message
    beg_code = %w(rgby).sample(4)
    play_game(beg_code)
  end

  def beg_game_play
    if guess.join == "c" || guess.join == "cheat"
      puts Messages.cheat_message
      play_game(beg_code)
    elsif guess.join == "q" || guess.join == "quit"
      puts Messages.quit_message
      exit
    elsif guess.length > 4
      puts Messages.long_guess_message
      play_game(beg_code)
    elsif guess.length < 4
      puts Messages.short_guess_message
      play_game(beg_code)
    else
      find_code_match(guess, beg_code)
    end
  end

  def check_letters_for_code_match(guess, beg_code)
    if guess == beg_code
      puts Messages.correct_message
      exit
    end
    positions = guess.zip(beg_code).count do | x |
                x[0] == x[1]
              end
    elements = guess.uniq.count do | x |
                  beg_code.include?(x)
              end
    puts Messages.incorrect_message
    play_game(beg_code)
  end
end
