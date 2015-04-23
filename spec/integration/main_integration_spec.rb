require 'spec_helper'

describe 'General integration test' do
  it 'should output a welcome message' do
    ttt = TicTacToe::Game.new
    expect { ttt.play }.to output("Let's play tic tac toe!\nPress enter to continue.\n").to_stdout
  end
end
