class Advanced
  attr_reader :adv_code

  def initialize
    @adv_code = adv_code
  end

  def adv_game_setup
    puts Messages.advanced_message
    adv_code = %w(r g b p y w).sample(8)
    play_game(adv_code)
  end

  def int_game_play
    if guess.join == "c" || guess.join == "cheat"
      puts "Wow. Are you serious? Hmmm... Ok, fine! The secret code is #{adv_code.join}, ya cheater..."
      play_game(adv_code)
    elsif guess.join == "q" || guess.join == "quit"
      puts Messages.quit_message
      exit
    elsif guess.length > 8
      puts Messages.long_guess_message
      play_game(adv_code)
    elsif guess.length < 8
      puts Messages.short_guess_message
      play_game(adv_code)
    else
      find_code_match(guess, adv_code)
    end
  end

  def check_letters_for_code_match(guess, adv_code)
    if guess == adv_code
      puts Messages.correct_message
      exit
    end
    positions = guess.zip(adv_code).count do | x |
                x[0] == x[1]
              end
    elements = guess.uniq.count do | x |
                  adv_code.include?(x)
              end
    puts Messages.incorrect_message
    play_game(adv_code)
  end
end
