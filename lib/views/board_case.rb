
class Board_Case ### TOUTE LA GRILLE (ABC,123, XO)
  attr_accessor :content, :coordinate

  def initialize(coordinate)
    @coordinate = coordinate
    @content = " "
  end

  def change_status (player_symbol)
    @content == " " ? content = player_symbol : (puts "Tu ne peux pas jouer ce coup.")
  end

end

# class Game_Case < Board_Case ### CASES AVEC X et O
#   def initialize(attribute)
#     @attribute = attribute
#   end

# end

# class Coordinate_Case < Board_Case ### CASES AVEC ABC, 123
#   def initialize(attribute)
#     @attribute = attribute
#   end
# end