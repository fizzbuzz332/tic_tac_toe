require_relative "computer"

module TicTacToe

  class Game
    def initialize
      @board = Array.new(3) { Array.new(3) { "-" } }
      @game_over = false
      @user_symbol = ""
      @winner = ""
      @computer = TicTacToe::Computer.new
    end

    def play
      puts "Let's play tic tac toe!"
      setup_game
      puts "Begin!!!"
      until @game_over
        print_board
        get_user_move
        check_game_over
      end
      puts "Game over!"
      puts "#{@winner} is the winner!"
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
        @computer.symbol = "O" :
        @computer.symbol = "X"
      puts "Then I will be #{@computer.symbol} >:)"
    end

    def print_board
      @board.each do |row|
        formatted_row = ""
        row.each { |column| formatted_row += (column + " ") }
        puts formatted_row
      end
    end

    def get_user_move
      puts "Write 'h' for help"
      user_move = gets.chomp
      case user_move
      when "h"
        puts "Move should be formatted as: 0 0 or 1 2"
      else
        make_move(user_move)
        make_computer_move
      end
    end

    def make_move(user_move)
      until validate_user_move(user_move)
        puts "Invalid move."
        get_user_move
      end
      @board[user_move[0].to_i][user_move[2].to_i] = @user_symbol
    end

    def validate_user_move(user_move)
      first = user_move[0]
      second = user_move[2]
      if (["0", "1", "2"].include? first) && (["0", "1", "2"].include? second)
        return true
      end
      return false
    end

    def make_computer_move
      @board.each_with_index do |row, ri|
        row.each_with_index do |column, ci|
          if @board[ri][ci] == "-"
            @board[ri][ci] = @computer.symbol
            return
          end
        end
      end
    end

    def check_game_over
      @board.each do |row|
        if row[0] != "-" && row[0] == row[1] && row[1] == row[2]
          @game_over = true
          @winner = row[0]
        end
      end

      if @board[0][0] != "-"
        if @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]
          @game_over = true
          @winner = @board[0][0]
        end
      end

      if @board[0][2] != "-"
        if @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0]
          @game_over = true
          @winner = @board[0][2]
        end
      end    
    end
  end


end