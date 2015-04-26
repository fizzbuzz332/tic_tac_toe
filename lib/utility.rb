module TicTacToe
  class Utility
    def snake_to_camel(snake_string)
      words = snake_string.to_s.split("_")
      words.map.with_index { |word, i| word.capitalize! unless i == 0 }
      return words.join
    end

    def snake_to_capitalized_camel(snake_string)
      snake_to_camel(snake_string.capitalize)
    end
  end
end