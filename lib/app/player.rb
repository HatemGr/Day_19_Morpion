class Player
  attr_accessor :name, :symbol, :points

  def initialize(player_name,symbol)
    @name = player_name
    @symbol = symbol
    @points = 0
  end

  def check_input(input) 
    if input.size < 2
      return false
    elsif input.upcase[0] =~ /[ABC]/ && input[1] =~ /[123]/ && input.size == 2
      return true
    end
  end

  def check_availability (board_case)
    return board_case.content == " "
  end

  def choose_case(board_cases)
    coordinate = ""
    next_turn = false
    until next_turn
      coordinate = gets.chomp
      coordinate = coordinate.upcase
      if check_input(coordinate)
        target_case = board_cases.select {|board_case| board_case.coordinate == coordinate }.first
        check_availability(target_case) ? (target_case.change_status(@symbol) ; next_turn = true) : (puts "Tu ne peux pas jouer ici, choisi une autre case :")
      else
        puts "Saisie incorrecte. Choisi une case correcte :"
      end
    end
  end
  

end