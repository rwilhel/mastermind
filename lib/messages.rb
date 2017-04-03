require './lib/mastermind'

class Messages


  def opening_message
    "

       ┏(-_-)┛┗(-_- )┓┗(-_-)┛┏(-_-)┓┏(-_-)┛┗(-_- )┓┗(-_-)┛┏(-_-)┓┏(-_-)┛┗(-_- )┓┗(-_-)┛
          M      M      A    SSSSS  TTTTT  EEEEE  RRRRR  M     M  IIIII  N   N  DDDD
          M M  M M     A A   S        T    E      R   R  M M M M    I    NN  N  D   D
          M M  M M    A   A   SSS     T    EEEEE  RRRR   M M M M    I    NN  N  D   D
          M   M  M    AAAAA      S    T    E      R   R  M  M  M    I    N N N  D   D
          M   M  M   A     A SSSSS    T    EEEEE  R   R  M  M  M  IIIII  N  NN  D DD
       ┏(-_-)┛┗(-_- )┓┗(-_-)┛┏(-_-)┓┏(-_-)┛┗(-_- )┓┗(-_-)┛┏(-_-)┓┏(-_-)┛┗(-_- )┓┗(-_-)┛


    "
  end

  def welcome_message
    "Welcome to MASTERMIND! Would you like to (p)lay, read the (i)nstructions, or (q)uit? >"
  end

  def level_options_message
    "Would you like to play the (b)eginner level for 4 positions, (i)ntermediate level for 6 positions or (a)dvanced level for 8 positions? >"
  end

  def beginner_message
    "I have generated a beginner sequence with four elements made up of four colors: (r)ed, (g)reen, (b)lue and (y)ellow. Type (q)uit at any time to end the game. What's your guess?"
  end

  def intermediate_message
   "I have generated an intermediate sequence with six elements made up of five colors: (r)ed, (g)reen, (b)lue, (p)urple and (y)ellow. Type (q)uit at any time to end the game. What's your guess?"
  end

  def advanced_message
    "I have generated an advanced sequence with eight elements made up of six colors (r)ed, (g)reen, (b)lue, (p)urple, (y)ellow and (w)hite. Type (q)uit at any time to end the game. What's your guess?"
  end

  def instructions_message
    "You need to guess the code that was chosen by the computer. Please enter (p)lay or (q)uit"
  end

  def quit_message
    "Thanks for playing!"
  end

end
