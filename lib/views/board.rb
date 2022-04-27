class Board
  attr_accessor :content, :board_case_list

  def initialize()
    @width = 9
    @board_case_list = []
    case_ = Board_Case.new(" ")
    case_.content = " "
    @board_case_list << case_
    case1 = Board_Case.new("1")
    case1.content = "1"
    @board_case_list << case1
    case2 = Board_Case.new("2")
    case2.content = "2"
    @board_case_list << case2
    case3 = Board_Case.new("3")
    case3.content = "3"
    @board_case_list << case3
    caseA = Board_Case.new("A")
    caseA.content = "A"
    @board_case_list << caseA
    @board_case_list << Board_Case.new("A1")
    @board_case_list << Board_Case.new("A2")
    @board_case_list << Board_Case.new("A3")
    caseB = Board_Case.new("B")
    caseB.content = "B"
    @board_case_list << caseB
    @board_case_list << Board_Case.new("B1") 
    @board_case_list << Board_Case.new("B2")
    @board_case_list << Board_Case.new("B3")
    caseC = Board_Case.new("C")
    caseC.content = "C"
    @board_case_list << caseC
    @board_case_list << Board_Case.new("C1")
    @board_case_list << Board_Case.new("C2")
    @board_case_list << Board_Case.new("C3")
  end

  def display_row(line_mumber)
    horizontal_line =  "-" 
    gap_line = "|" + " ".rjust(@width - 2," ")
    puts horizontal_line * (@width * 4 - 3)
    puts gap_line * 4 + "|"
    str = ""
    [*0..3].each{|i| str << ("|" + " ".rjust(@width/2-1," ") + @board_case_list[i + line_mumber * 4].content.ljust(@width/2," ")) }
    puts str + "|"
    puts gap_line * 4 + "|"
  end

  def display_board
    [*0..3].each{|row_nbr| display_row(row_nbr)}
    puts "-" * (@width * 4 - 3)
  end

  def all
    return @board_case_list
  end

end