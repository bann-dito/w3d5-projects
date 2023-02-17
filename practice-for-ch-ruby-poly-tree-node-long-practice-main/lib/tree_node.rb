class PolyTreeNode

        attr_reader :parent, :children, :value

        def initialize(value, parent = nil, children = [])
            @value = value
            @parent = parent
            @children = children

        end

        def parent=(new_parent)
            if self.parent 
                self.parent.children.delete(self) 
            end 

            @parent = new_parent
            if self.parent
                if !@parent.children.include?(self)
                    new_parent.children << self
                end
            end
            self
        end
  
end