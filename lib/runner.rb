class Runner

  def run_the_files
    mastermind = Mastermind.new
    mastermind.game_start
    user_input = gets.chomp.downcae
    mastermind.start_menu_options(user_input)
    level_input = gets.chomp.downcase
    mastermind.level_options(level_input)
    guess = gets.chomp.downcase.chars
    mastermind.beg_game_play(guess)
  end
end
