class Board
@@content_list = [" ","1","2","3","A","X","O","X","B"," "," "," ","C"," "," ",]
  def initialize()
    @width = 9
  end

  def display_row(line_mumber)
    horizontal_line =  "-" * @width
    gap_line = "|" + " ".rjust(@width - 2," ")

    puts horizontal_line * 4
    puts gap_line * 4 + "|"
    str = ""
    [*0..3].each{|i| str << ("|" + " ".rjust(@width/2-1," ") + @@content_list[i + line_mumber * 4].ljust(@width/2," ")) }
    puts str + "|"
    #puts (6.times {|i| print "|" + " ".rjust(@width/2-1," ") + @@content_list[i + line_mumber * 4].ljust(@width/2," ") })
    puts gap_line * 4 + "|"
    puts horizontal_line * 4
  end

end