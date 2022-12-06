class Teller
    def initialize
        @customers = SizedQueue.new(5) #max is 5
    end
    
    def add_to_queue(customer, i)
        @customers.push(customer)
        #puts "Customer #{i} added to queue"
    end

    def get_line_size
        @customers.length
    end

    def get_last
        @customers.last
    end
    
    def serve(tellerName) 
        @customers.pop
        puts "Served by teller #{tellerName}"
    end
end
