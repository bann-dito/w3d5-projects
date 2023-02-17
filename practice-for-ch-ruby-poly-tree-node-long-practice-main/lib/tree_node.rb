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

        def add_child(child)
            child.parent=(self)
        end

        def remove_child(child)
            # self.children.delete(child)
            # child.parent=(nil)
            if !children.include?(child)
                raise "Child doesn't exist"
            else
                child.parent=(nil)
            end
        end
  
        def dfs(target_value)
            return self if target_value == self.value

            self.children.each do |child|
                result = child.dfs(target_value)
                return result unless result.nil?
            end
            nil
        end
end