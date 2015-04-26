require 'spec_helper'

describe "Utility" do
  before :each do
    @utility = TicTacToe::Utility.new
  end

  describe '#snake_to_camel' do
    it 'should translate hello_world_hi_friend to helloWorldHiFriend' do
      expect(@utility.snake_to_camel("hello_world_hi_friend")).to eq("helloWorldHiFriend")
    end

    it 'should ignore trailing _' do
      expect(@utility.snake_to_camel("hello_world_")).to eq("helloWorld")
    end

    it 'should return the same single word' do
      expect(@utility.snake_to_camel("hello")).to eq("hello")
    end
  end

  describe '#snake_to_capitalized_camel' do
    it 'should return a capitalized camel' do
      expect(@utility.snake_to_capitalized_camel("hello_world")).to eq("HelloWorld")
    end
  end
end