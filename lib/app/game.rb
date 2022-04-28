class Game
  attr_accessor :myboard, :round_number, :player_on, :game_on
  @@player_list = []
  
  def initialize()
    ### --- Creation des joueurs
    # ----- Choix des noms
    puts "Quel est le nom du Joueur 1 ?"
    p1_name = gets.chomp
    puts "Quel est le nom du Joueur 2 ?"
    p2_name = gets.chomp
    # ----- Distribution des symboles
    # x_red = "X".colorize(:white).colorize(:background => :red)
    # o_green = "X".colorize(:white).colorize(:background => :green)
    x_red = "X"
    o_green = "O"
    rand(1..2) == 1 ? (p1_symbol = x_red ; p2_symbol = o_green) : (p1_symbol = o_green ; p2_symbol = x_red)
    # ----- Instantiation et ajout des joueurs dans une liste de classe
    @player_1 = Player.new(p1_name,p1_symbol)
    @player_2 = Player.new(p2_name,p2_symbol)
    @@player_list << @player_1
    @@player_list << @player_2
    # ----- Petit message au terminal
    puts "#{@player_1.name} aura les #{p1_symbol} et #{@player_2.name} aura les #{p2_symbol}."
    # ----- Celui qui a les "X" commence sachant que l'on switch en entrant dans la boucle
    @player_on = @@player_list.select{|player| player.symbol == "O"}.first
    
    ### --- Ceation des cases du board
    Board_Case.new(" "," ")
    Board_Case.new(" ","1")
    Board_Case.new(" ","2")
    Board_Case.new(" ","3")
    Board_Case.new(" ","A")
    Board_Case.new("A1"," ")
    Board_Case.new("A2"," ")
    Board_Case.new("A3"," ")
    Board_Case.new(" ","B")
    Board_Case.new("B1"," ")
    Board_Case.new("B2"," ")
    Board_Case.new("B3"," ")
    Board_Case.new(" ","C")
    Board_Case.new("C1"," ")
    Board_Case.new("C2"," ")
    Board_Case.new("C3"," ")

    ### --- Creation du board
    @myboard = Board.new(Board_Case.all)

    ## --- Initialisation du round à 1 et partie 1
    @session_number = 0
    @round_number = 1

    ## --- Initialisation du header
    @myheader = Header.new(@player_1,@player_2)

    ## --- Au debut le jeu est en cours
    @game_on = true

  end

  def display_board
    @myboard.display_board
  end

  def display_header
    @myheader.display_round(@session_number)
    @myheader.display_header_score
    @myheader.display_header_turn(@player_on)
  end

  def player_switch
    @player_on == @@player_list[0] ? @player_on = @@player_list[1] : @player_on = @@player_list[0]
  end

  def player_move()
    puts "#{@player_on.name}, à toi de jouer ! Choisi la case ou jouer :"
    @player_on.choose_case(Board_Case.all)
  end

  def next_round
    @round_number += 1
    return @round_number
  end

  def check_horizontal_win(row)
    check_list = Board_Case.all.select {|board_case| board_case.coordinate[0] == row}
    check_list.map! {|board_case| board_case.content}
    return check_list.uniq.size == 1 && !(check_list.include?(" "))
  end

  def check_vertical_win(column)
    check_list = Board_Case.all.select {|board_case| board_case.coordinate[1] == column}
    check_list.map! {|board_case| board_case.content}
    return check_list.uniq.size == 1 && !(check_list.include?(" "))
  end

  def check_diagonal_win
    d1 = ["A1","B2","C3"]
    d2 = ["A3", "B2","C1"]
    list_d1 = Board_Case.all.select {|board_case| d1.include?(board_case.coordinate)}
    list_d2 = Board_Case.all.select {|board_case| d2.include?(board_case.coordinate)}
    list_d1.map! {|board_case| board_case.content}
    list_d2.map! {|board_case| board_case.content}
    return false if (list_d1.include?(" ") && list_d2.include?(" "))
    return (list_d1.uniq.size == 1 || list_d2.uniq.size == 1)
  end

  def check_win
    row_list = ["A","B","C"]
    colum_list = ["1","2","3"]
    all_checks = []
    row_list.each {|row| all_checks << check_horizontal_win(row)}
    colum_list.each{|column| all_checks << check_vertical_win(column)}
    all_checks << check_diagonal_win
    return all_checks.include?(true)
  end

  def end_game
    if self.check_win
      puts "C'est fini !!! #{@player_on.name} a gagné"
      @player_on.score += 1
    else
      puts "C'est un match nul !"
    end

  end

  def rematch?
    input = ""
    puts "Souhaitez vous recommencer une partie ? [o/n]"
    print "->"
    input = gets.chomp
    until input.downcase =~ /[on]/
      "Repondre o,O,n ou N sinon moi pas comprendre."
      print "->"
      input = gets.chomp
    end
    input.downcase == "o" ? @game_on = true : @game_on = false
  end

  def game_reset
    Board_Case.reset
    @round_number = 1
    @session_number += 1
  end

end
