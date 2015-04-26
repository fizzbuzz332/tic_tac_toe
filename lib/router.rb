module TicTacToe
  class Router
    attr_reader :routes
    attr_reader :controllers

    def initialize
      @routes = {}
      bootstrap_controller_names
    end

    def add_route(route_name, route_controller, route_method)
      @routes[route_name] = {
        controller: route_controller,
        method:     route_method
      }
    end

    def route(route_name)
      #current_route = @routes[route_name]
      #class_name = current_route[:controller]
      #Object.const_get("TicTacToe").const_get()
    end

    private
    def bootstrap_controller_names
      controllers = Dir["controllers/*_controller.rb"]
      @controllers = []
      controllers.each do |controller|
        @controllers << controller.gsub("_controller.rb", "")
      end
    end
  end
end
