class PolyTreeNode

        attr_reader :parent, :children, :value

        def initialize(value, parent = nil, children = [])
            @value = value
            @parent = parent
            @children = children

        end

        def parent=(new_parent)

            @parent = new_parent
            if !@parent.children.include?(self)
                new_parent.children << self
            else
                @children
            end


            
        end
  
end