
class Board_Case ### TOUTE LA GRILLE (ABC,123, XO)
  attr_accessor :content, :coordinate
  @@board_case_list =[]

  def initialize(coordinate,content)
    @coordinate = coordinate
    @content = content
    @@board_case_list << self
  end

  def to_s
    puts "Coordonnée #{@coordinate}"
    puts "Contenu : #{@content}"
  end

  def change_status (player_symbol)
    #@content == " " ? @content = player_symbol : (puts "Tu ne peux pas jouer ce coup.")
    @content = player_symbol
  end

  def self.all
    return @@board_case_list
  end

end