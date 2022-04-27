
class Board_Case ### TOUTE LA GRILLE (ABC,123, XO)

  def initialize(coordinate)
    @coordinate= coordinate
    @content = "X"
  end

end

class Game_Case < Board_Case ### CASES AVEC X et O
  def initialize(attribute)
    @attribute = attribute
  end

end

class Coordinate_Case < Board_Case ### CASES AVEC ABC, 123
  def initialize(attribute)
    @attribute = attribute
  end
end