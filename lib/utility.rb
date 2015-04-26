module TicTacToe
  class Utility
    def snake_to_camel(snake_string)
      snake_array = snake_string.split("_")
      snake_array.map.with_index do |word, index|
        word.capitalize! unless index == 0
      end
      return snake_array.join
    end

    def snake_to_capitalized_camel(snake_string)
      snake_to_camel(snake_string.capitalize)
    end
  end
end