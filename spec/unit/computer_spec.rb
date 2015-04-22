require 'spec_helper'

describe 'Test Computer' do
  it 'should set a symbol' do
    computer = TicTacToe::Computer.new
    computer.symbol = "X"
    expect(computer.symbol).to eq("X")
  end
end