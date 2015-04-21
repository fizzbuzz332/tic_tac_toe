require 'spec_helper'

describe 'Board' do
  before :each do
    @board = TicTacToe::Board.new
  end

  it 'should have a nested board of "-" when initialized' do
    sample_board = Array.new(3) { Array.new(3) { "-" } }
    expect(@board.board).to eq(sample_board)
  end

  it 'should place a symbol at a given location' do
    @board.set_tile('X', 0, 1)
    expect(@board.get_tile(0, 1)).to eq('X')
  end

  it 'should not set a tile if the tile is already taken' do
    @board.set_tile('X', 0, 1)
    expect(@board.set_tile('X', 0, 1)).to be false
  end

  describe 'should check for a winner' do
    it 'should pass winner for horizontal' do
      @board.set_tile('X', 0, 0)
      @board.set_tile('X', 0, 1)
      @board.set_tile('X', 0, 2)
      expect(@board.is_there_a_winner?).to be true
    end

    it 'should not pass if there are no horizontal, vertical, or diagonal' do
      expect(@board.is_there_a_winner?).to be false
    end

    it 'should pass winner for vertical' do
      @board.set_tile('X', 0, 0)
      @board.set_tile('X', 1, 0)
      @board.set_tile('X', 2, 0)
      expect(@board.is_there_a_winner?).to be true
    end

    describe 'winner for vertical' do
      it 'should pass winner for left to right vertical' do
        @board.set_tile('X', 0, 0)
        @board.set_tile('X', 1, 1)
        @board.set_tile('X', 2, 2)
        expect(@board.is_there_a_winner?).to be true
      end

      it 'should pass winner for right to left vertical' do
        @board.set_tile('X', 0, 2)
        @board.set_tile('X', 1, 1)
        @board.set_tile('X', 2, 0)
        expect(@board.is_there_a_winner?).to be true
      end
    end
  end
end