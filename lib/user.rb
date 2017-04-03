
class User

  def user_input
    user_input = gets.chomp.downcase
    return user_input 
  end

  # def level_input
  #   level_input = gets.chomp.downcase
  #   Mastermind.level_options(level_input)
  # end

  # def guess_input
  #   puts Messages.new.beginner_message
  #   guess = gets.chomp.downcase.chars
  #   mastermind.player_input(guess)
  # end
end
