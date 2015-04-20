class TicTacToe
  def initialize
    @board = Array.new(3) { Array.new(3) { "-" } }
    @game_over = false
    @user_symbol = ""
    @computer_symbol = ""
  end

  def play
    puts "Let's play tic tac toe!"
    setup_game
    until @game_over
      print_board
      @game_over = true
    end
  end

  private
  def setup_game
    puts "Would you like to be 'X' or 'O'?"
    user_input = gets.chomp
    until ["X", "O"].include? user_input
      puts "Please choose either 'X' or 'O'"
      user_input = gets.chomp
    end
    puts "Great choice!!"
    @user_symbol = user_input
    @user_symbol == "X" ? 
      @computer_symbol = "O" :
      @computer_symbol = "X"
    puts "Then I will be #{@computer_symbol} >:)"
  end

  def print_board
    @board.each do |row|
      formatted_row = ""
      row.each { |column| formatted_row += (column + " ") }
      puts formatted_row
    end
  end
end