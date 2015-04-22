module TicTacToe
  class Board
    attr_accessor :board

    def initialize
      @board = Array.new(3) { Array.new(3) { "-" } }
    end

    def set_tile(symbol, x, y)
      if @board[x][y] == "-"
        @board[x][y] = symbol
      else
        return false
      end
    end

    def get_tile(x, y)
      @board[x][y]
    end

    def is_there_a_winner?
      return check_horizontal || check_vertical || check_diagonal
    end

    def print_board
      @board.each do |row|
        formatted_row = ""
        row.each { |column| formatted_row += (column + " ") }
        puts formatted_row
      end
    end

    private
    def check_combo_of(row)
      return row[0] != "-" && row.uniq.length == 1
    end

    def check_horizontal
      @board.map { |row| check_combo_of row }.include? true
    end

    def check_vertical
      result = false
      (0..2).each do |column_i|
        column = []
        (0..2).each do |row_i|
          column << @board[row_i][column_i]
        end
        result ||= check_combo_of column
      end
      result
    end

    def check_diagonal
      left_to_right = [@board[0][0], @board[1][1], @board[2][2]]
      right_to_left = [@board[0][2], @board[1][1], @board[2][0]]
      return check_combo_of(left_to_right) || check_combo_of(right_to_left)
    end
  end
end