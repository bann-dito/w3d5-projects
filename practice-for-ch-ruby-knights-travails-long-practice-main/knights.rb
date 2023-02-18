require_relative "../practice-for-ch-ruby-poly-tree-node-long-practice-main/lib/tree_node.rb"

class KnightPathFinder

    attr_reader :root_node
    DELTAS = [[2, 1], [-2, 1], [2, -1], [-2, -1], [1, 2], [-1, 2], [1, -2], [-1, -2]]

    def initialize(pos)
        @board = Array.new(8) {Array.new(8)}
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        
    end

    def self.valid_moves(pos)
        x, y = pos
        new_pos = DELTAS.map { |(dx, dy)| [x + dx, y + dy] }
        if new_pos.filter do |ele|
            x , y = ele
            if x < 8 || y < 8 &&  x >= 0 || y >= 0
                ele
            end
        end

    end

    def new_move_oositions(pos)
        @considered_positions = []
        @considered_positions << KnightPathFinder.valid_moves(pos)
        
    end

end