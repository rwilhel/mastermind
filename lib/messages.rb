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
    "What level would you like to play? Select (b)beginnger for 4 positions, (i)intermediate for 6 positions or (a) advanced for 8 positions."
  end

  def level_chosen_message(level)
    case level
    when :beginner then "I have generated a beginner sequence   with four elements made up of: (r)ed,(g)reen, (b)lue and (y)ellow. Use (q)uit at any time to end the game. What's your guess?"
    when :intermediate then "I have generated an intermediate sequence with six elements made up of five colors: (r)ed, (g)reen, (b)lue, (p)urple and (y)ellow. Use (q)uit at any time to end the game. What's your guess?"
    when :advanced then "I have generated an advanced sequence with eight elements made up of six colors (r)ed, (g)reen, (b)lue, (p)urple, (y)ellow and (w)hite. Use (q)uit at any time to end the game. What's your guess?"
    end
  end

  def start_play_message(input)
    if input == "p"
    "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. What's your guess?"
    elsif input == "i"
    "MasterMind is a game! Please enter (p)lay or (q)uit"
    elsif input == "q"
    "Thanks for playing!"
    elsif input == "v"
    "Please enter one of the given letters\n"
    end
  end


end
