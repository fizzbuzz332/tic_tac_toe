require_relative "computer"
require_relative "board"

module TicTacToe

  class Game
    def initialize
      @board = TicTacToe::Board.new
      @game_over = false
      @user_symbol = ""
      @winner = ""
      @computer = TicTacToe::Computer.new
      @last_mover = ""
    end

    def play
      puts "Let's play tic tac toe!"
      puts "Press enter to continue."
      #setup_game
      #puts "Begin!!!"
      #until @game_over
      #  @board.print_board
      #  get_user_move
      #  check_game_over
      #end
      #puts "Game over!"
      #puts "#{@winner} is the winner!"
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
      @board.set_tile(@user_symbol, user_move[0].to_i, user_move[2].to_i)
      @last_mover = @user_symbol
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
      @board.board.each_with_index do |row, ri|
        row.each_with_index do |column, ci|
          if @board.board[ri][ci] == "-"
            @board.set_tile(@computer.symbol, ri, ci)
            @last_mover = @computer.symbol
            return
          end
        end
      end
    end

    def check_game_over
      @game_over = @board.is_there_a_winner?
      @winner = @last_mover
    end
  end


end