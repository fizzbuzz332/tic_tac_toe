require 'spec_helper'

describe 'Interface' do
  before :each do
    @interface = TicTacToe::Interface.new
  end

  it 'should make a request do the right view' do
    expect { @interface.request("home") }.to output(/Welcome/).to_stdout
  end
end