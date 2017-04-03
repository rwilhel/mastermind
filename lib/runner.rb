class Runner

  def run_the_files
    mastermind = Mastermind.new
    mastermind.game_start
  end

  def initial_user_input
    user_input = gets.chomp.downcase
    mastermind.start_menu_options(user_input)
  end

  def level_input
    level_input = gets.chomp.downcase
    mastermind.level_options(level_input)
  end

  def guess_input
    guess = gets.chomp.downcase.chars
    mastermind.beg_game_play(guess)
  end
end
