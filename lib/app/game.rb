class Game
  @@player_list = []
  
  def initialize()
    @player_1 = Player.new("NAME_1")
    @player_2 = Player.new("NAME_2")
  end
  
end