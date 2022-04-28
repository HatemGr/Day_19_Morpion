
class Board_Case ### TOUTE LA GRILLE (ABC,123, XO)
  attr_accessor :content, :coordinate
  @@board_case_list =[]

  def initialize(coordinate,content)
    @coordinate = coordinate
    @content = content
    @@board_case_list << self
  end

  def to_s
    puts "Coordonnée : #{@coordinate}"
    puts "Contenu : #{@content}"
  end

  def change_status (player_symbol)
    @content = player_symbol
  end

  def self.all
    return @@board_case_list
  end

  def self.reset
    @@board_case_list.each.with_index {|board_case,i| board_case.coordinate == " " ? board_case : @@board_case_list[i].content = " " }
  end

end