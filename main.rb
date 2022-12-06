#queing simulation

require_relative 'models/teller.rb'
require_relative 'models/customer.rb'
require_relative 'helpers/queue.rb'
require_relative 'models/dispatcher.rb'

class Simulation
    def initialize(max_customers)
        @count_serve_customers = 0
        @max_customers = max_customers
        #initialize the 3 tellers
        @tellers = [Teller.new("Teller A"), Teller.new("Teller B"), Teller.new("Teller C")]

        @queue = Queue.new
    end
  
    def run
      # simulate customers arriving at random intervals
      Thread.new do
        while true
          @queue.enqueue(Customer.new(rand(1..100)))
          sleep(rand)
        end
      end
  
      # simulate tellers serving customers
      while true
        # check if there are any customers in the queue
        if !@queue.empty?
          # find the first available teller
          teller = @tellers.find { |t| !t.busy? }

          # if a teller is available, have them serve the customer
          if teller
            customer = @queue.dequeue
            teller.serve(customer)

            @count_serve_customers += 1
          end
        end

        #break loop if server customers reached 50
        if(@count_serve_customers == @max_customers)
            break;
        end
      end
    end
end

# Run the simulation with 3 tellers
Simulation.new(20).run





