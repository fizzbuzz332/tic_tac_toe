require 'spec_helper'

describe 'Interface' do
  before :each do
    @interface = TicTacToe::Interface.new
  end

  it 'should print what it is given as a response' do
    string = "hello"
    expect { @interface.render(string) }.to output(string).to_stdout
  end
end