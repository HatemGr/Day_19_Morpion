class Header
  def initialize(player_1,player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  def display_header_score
    puts "#{@player_1.name}".ljust(17," ") + "#{@player_2.name}".rjust(16," ")
    puts "Symbole : #{@player_1.symbol}".ljust(17," ") + "Symbole : #{@player_2.symbol}".rjust(16," ")
    puts "Score : #{@player_1.score}".ljust(17," ") + "Score : #{@player_2.score}".rjust(16," ")
  end

  def display_header_turn(player)
    puts "#{player.name} joue avec les #{player.symbol}".center(33," ")
  end

end