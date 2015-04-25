module TicTacToe
  class Router
    attr_reader :routes

    def initialize
      @routes = {}
    end

    def add_route(route_name, route_controller, route_method)
      @routes[route_name] = {
        controller: route_controller,
        method:     route_method
      }
    end

    def route(route_name)
      current_route = @routes[route_name]   
    end
  end
end