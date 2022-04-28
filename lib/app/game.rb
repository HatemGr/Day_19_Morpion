class Game
  attr_accessor :myboard, :round_number
  @@player_list = []
  
  def initialize(player_1,player_2)
    ### --- Creation des joureurs
    @player_1 = player_1
    @player_2 = player_2

    ### --- Ceation des cases du board
    case_ = Board_Case.new(" "," ")
    case1 = Board_Case.new(" ","1")
    case2 = Board_Case.new(" ","2")
    case3 = Board_Case.new(" ","3")
    caseA = Board_Case.new(" ","A")
    caseA1 = Board_Case.new("A1"," ")
    caseA2 = Board_Case.new("A2"," ")
    caseA3 = Board_Case.new("A3"," ")
    caseB = Board_Case.new(" ","B")
    caseB1 = Board_Case.new("B1"," ")
    caseB2 = Board_Case.new("B2"," ")
    caseB3 = Board_Case.new("B3"," ")
    caseC = Board_Case.new(" ","C")
    caseC1 = Board_Case.new("C1"," ")
    caseC2 = Board_Case.new("C2"," ")
    caseC3 = Board_Case.new("C3"," ")

    ### --- Creation du board
    @myboard = Board.new(Board_Case.all)

    ## --- Initialisation du round à 1
    @round_number = 1

  end

  def display_board
    @myboard.display_board
  end

  def player_move(player)
    puts "#{player.name}, à toi de jouer ! Choisi la case ou jouer :"
    player.choose_case(Board_Case.all)
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
    return all_checks.include?(true)
  end

end