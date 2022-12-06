class Queue
    def initialize
      @queue = []
    end
  
    def enqueue(customer)
      @queue.push(customer)
    end
  
    def dequeue
      @queue.shift
    end
  
    def empty?
      @queue.empty?
    end
end