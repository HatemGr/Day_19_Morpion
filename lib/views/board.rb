class Board
  attr_accessor :content, :board_case_list

  def initialize(board_cases)
    @width = 9
    @board_case_list = board_cases
  end

  def display_row(line_mumber)
    horizontal_line =  "-" 
    gap_line = "|" + " ".rjust(@width - 2," ")
    puts horizontal_line * (@width * 4 - 3)
    puts gap_line * 4 + "|"
    str = ""
    [*0..3].each{|i| str << ("|" + " ".rjust(@width/2-1," ") + @board_case_list[i + line_mumber * 4].content + " ".rjust(@width/2 - 1," ")) }
    puts str + "|"
    puts gap_line * 4 + "|"
  end

  def display_board
    [*0..3].each{|row_nbr| display_row(row_nbr)}
    puts "-" * (@width * 4 - 3)
  end

end