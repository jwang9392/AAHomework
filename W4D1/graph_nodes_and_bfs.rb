require "byebug"
require "set"

class GraphNode
    attr_reader :name
    attr_accessor :neighbors
    
    def initialize(name)    
        @name = name
        @neighbors = []
    end

    def bfs(target_value)
        queue = [self]
        visited = Set.new()

        until queue.length == 0
            node = queue.shift
            return node if node.name == target_value

            if !visited.include?(node)
                visited.add(node)
                node.neighbors.each { |neighbors| queue << neighbors }
            end
        end

        nil
    end
    
    
end 

if __FILE__ == $PROGRAM_NAME
    a = GraphNode.new('a')
    b = GraphNode.new('b')
    c = GraphNode.new('c')
    d = GraphNode.new('d')
    e = GraphNode.new('e')
    f = GraphNode.new('f')
    a.neighbors = [b, c, e]
    c.neighbors = [b, d]
    e.neighbors = [a]
    f.neighbors = [e]
    p a.bfs("f")

end