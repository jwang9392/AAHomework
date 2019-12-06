class Stack
    attr_reader :stack

    def initialize
        # create ivar to store stack here!
        @stack = []
    end

    def push(el)
        # adds an element to the stack
        @stack << el
    end

    def pop
        # removes one element from the stack
        @stack.pop
    end

    def peek
        # returns, but doesn't remove, the top element in the stack
        @stack[-1]
    end
end

class Queue
    attr_reader :queue

    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue << el
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue[-1]
    end
end

class Map
    def initialize
        @map = []
    end

    def set(key, value)
        @map.each do |kv_pair|
            return kv_pair[1] = value if kv_pair[0] == key
        end
        @map << [key, value]
    end

    def get(key)
        @map.each do |kv_pair|
            return kv_pair[1] if kv_pair[0] == key
        end
    end

    def delete(key)
        @map.each_with_index do |kv_pair, idx|
            if kv_pair[0] == key
                return @map.take(idx) + @map.drop(idx + 1)
            end
        end
    end 

    def show
        @map
    end
end

if __FILE__ == $PROGRAM_NAME

end