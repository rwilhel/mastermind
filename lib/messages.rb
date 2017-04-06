require 'pry'
require './lib/beginner'

class Messages

  def self.opening_message
    "

                          ┏(-_-)┛┗(-_- )┓┗(-_-)┛┏(-_-)┓┏(-_-)┛┗(-_- )┓┗(-_-)┛┏(-_-)┓┏(-_-)┛┗(-_- )┓┗(-_-)┛

                        ███╗   ███╗ █████╗ ███████╗████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗██████╗
                        ████╗ ████║██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗
                        ██╔████╔██║███████║███████╗   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║██║  ██║
                        ██║╚██╔╝██║██╔══██║╚════██║   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██║  ██║
                        ██║ ╚═╝ ██║██║  ██║███████║   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██████╔╝
                        ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═════╝

                        ┏(-_-)┛┗(-_- )┓┗(-_-)┛┏(-_-)┓┏(-_-)┛┗(-_- )┓┗(-_-)┛┏(-_-)┓┏(-_-)┛┗(-_- )┓┗(-_-)┛


    "
  end

  def self.welcome_message
    "Welcome to MASTERMIND! Would you like to (p)lay, read the (i)nstructions, or (q)uit? >\n"
  end

  def self.level_options_message
    "Would you like to play the (b)eginner level for 4 positions, (i)ntermediate level for 6 positions or (a)dvanced level for 8 positions? >\n"
  end

  def self.beginner_message
    "I have generated a beginner sequence with four elements made up of four colors: (r)ed, (g)reen, (b)lue and (y)ellow. Type (q)uit at any time to end the game. Get the secret code by typing (c)heat. What's your guess?\n"
  end

  def self.intermediate_message
   "I have generated an intermediate sequence with six elements made up of five colors: (r)ed, (g)reen, (b)lue, (p)urple and (y)ellow. Type (q)uit at any time to end the game. Get the secret code by typing (c)heat. What's your guess?\n"
  end

  def self.advanced_message
    "\nI have generated an advanced sequence with eight elements made up of six colors (r)ed, (g)reen, (b)lue, (p)urple, (y)ellow and (w)hite. Type (q)uit at any time to end the game. Get the secret code by typing (c)heat. What's your guess?\n"
  end

  def self.instructions_message
    "You need to guess the code that was chosen by the computer.\n"
  end

  def self.quit_message
    "Thanks for playing!\n"
  end

  def self.long_guess_message
    "Your guess is too long. :( Try again!\n"
  end

  def self.short_guess_message
    "Your guess is too short. :( Try again!\n"
  end

  def self.correct_message(guess, guess_count, minutes, seconds)
    "Congratulations! You guessed the sequence '#{guess.join}' in #{guess_count} guesses and it only took #{minutes} minute(s) and #{seconds} second(s).\n"
  end

  def self.incorrect_message(element, position, guess_count)
    "Wrong! Your guess has #{element} of the correct elements with #{position} in the correct positions. Guess(es) taken: #{guess_count}\n"
  end
end
