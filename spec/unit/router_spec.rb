require "spec_helper"

describe "Router" do
  before :each do
    @router = TicTacToe::Router.new
  end

  it 'should add a route' do
    @router.add_route(:home, :home_controller, :menu)
    expect(@router.routes).to eq(
      { home: { controller: :home_controller, method: :menu }}
    )
  end

  it 'should call the right controller method' do
    #home_controller = double("HomeController")
    #allow(home_controller).to receive(:menu).and_return("Welcome!")
    #@router.add_route(:home, :home_controller, :menu)
    #expect(@router.route(:home)).to include("Welcome!")
  end
end
