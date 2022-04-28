class Game
  attr_accessor :myboard, :round_number, :player_on
  @@player_list = []
  
  def initialize()
    ### --- Creation des joureurs
    puts "Quel est le nom du Joueur 1 ?"
    p1_name = gets.chomp
    puts "Quel est le nom du Joueur 2 ?"
    p2_name = gets.chomp

    rand(1..2) == 1 ? (p1_symbol = "X" ; p2_symbol = "O") : (p1_symbol = "O" ; p2_symbol = "X")

    @player_1 = Player.new(p1_name,p1_symbol)
    @player_2 = Player.new(p2_name,p2_symbol)
    @@player_list << @player_1
    @@player_list << @player_2

    puts "#{@player_1.name} aura les #{p1_symbol} et #{@player_2.name} aura les #{p2_symbol}."

    @player_on = @@player_list.select{|player| player.symbol == "X"}.first
    
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

    ## --- Initialisation du round à 1
    @round_number = 1

  end

  def display_board
    @myboard.display_board
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

end