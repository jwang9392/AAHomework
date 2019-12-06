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
                @map.delete_at(idx)
            end
        end
    end 

    def show
        @map
    end
end

if __FILE__ == $PROGRAM_NAME
    # #exercise1 - stack tests
    # new_stack = Stack.new
    # new_stack.push(1)
    # new_stack.push(2)
    # new_stack.push(7)
    # p new_stack
    # new_stack.pop
    # p new_stack.stack
    # p new_stack.peek
    # p new_stack.stack

    # #exercise2 - queue tests
    # new_q = Queue.new
    # new_q.enqueue("hi")
    # new_q.enqueue("there")
    # new_q.enqueue("friend")
    # p new_q
    # new_q.dequeue
    # p new_q.queue
    # p new_q.peek
    # p new_q.queue

    # #exercise3 - map test
    # new_map = Map.new
    # new_map.set(1, "hello")
    # p new_map.show
    # new_map.set(1, "bye")
    # p new_map.show
    # p new_map.get(1)
    # new_map.set(2, "I SAID GOOD DAY")
    # new_map.delete(1)
    # p new_map.show

end