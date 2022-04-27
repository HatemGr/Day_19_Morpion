class Player
  
  def initialize(player_name)
    @player_name = player_name
    @points = 0
    @symbol = "X"
    @myboard = Board.new()
  end

  def choose_case(coordinate)
    target_case = @myboard.all.select {|board_case| board_case.coordinate == coordinate}.first
    puts target_case.content
  end

end