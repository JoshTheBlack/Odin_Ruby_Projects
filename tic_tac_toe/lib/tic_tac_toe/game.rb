# frozen_string_literal: true

module TicTacToe
  class Game
    attr_reader :players, :board, :current_player, :other_player

    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def solicit_move
      "#{current_player.name}: Enter a number between 1 and 9 to make your move"
    end

    def get_move(human_move = gets.chomp)
      loop do
        valid = %w[1 2 3 4 5 6 7 8 9]
        return human_move_to_coordinate(human_move) if valid.include?(human_move)

        puts 'Invalid selection, try again.'
        human_move = gets.chomp
      end
    end

    def human_move_to_coordinate(human_move)
      mapping = {
        '1' => [0, 0],
        '2' => [1, 0],
        '3' => [2, 0],
        '4' => [0, 1],
        '5' => [1, 1],
        '6' => [2, 1],
        '7' => [0, 2],
        '8' => [1, 2],
        '9' => [2, 2]
      }
      mapping[human_move]
    end

    def game_over_message
      return "#{current_player.name} won!" if board.game_over == :winner
      return 'The game ended in a tie' if board.game_over == :draw
    end

    def play
      puts "#{current_player.name} has randomly been selected as the first player"
      loop do
        board.formatted_grid
        puts ''
        puts solicit_move
        x, y = get_move
        if board.get_cell(x, y).value == ''
          board.set_cell(x, y, current_player.color)
        else
          puts 'Invalid selection.  Try again'
          next
        end
        if board.game_over
          puts game_over_message
          board.formatted_grid
          return
        else
          switch_players
        end
      end
    end
  end
end
