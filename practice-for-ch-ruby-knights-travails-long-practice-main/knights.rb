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

    def new_move_positions(pos)

        moves = KnightPathFinder.valid_moves(pos)
        moves.select! { |move| !@considered_positions.include?(move) }
        @considered_positions += moves
        moves
        

    end

    def build_move_tree

        queue = [@root_node]


        until queue.empty?
            #iterate through queue
            #var = queue.shift 
            #pass var to new_moveposition
            #assign var to eval of new_moveposition
            #iterate through var to make each polytree node class
            #shovel to add nodes to queue
            #add thos to our queue


            prev_nodes = queue.shift
            moves = new_move_positions(prev_nodes.value)
            moves.each do |pos|
                new_node = PolyTreeNode.new(pos, prev_nodes)
                prev_nodes.add_child(new_node)
                queue << new_node
            end

        end


        
    end

end