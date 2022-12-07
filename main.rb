#queing simulation
require_relative 'models/teller.rb'
require_relative 'models/customer.rb'

#customer task type
# 1x = normal
# 2x = heavy

#teller speed
# teller A = 1
# teller B = 2
# teller C = 3

class Simulation

    def initialize(max_customers)
        @current_customer_serving = 0
        @max_customers = max_customers
        @time = 0
        #initialize the 3 tellers
        @tellers = [Teller.new("Teller A", 1), Teller.new("Teller B", 2), Teller.new("Teller C", 3)]
    end
  
    def run
      while true
        puts "time #{@time}"
        num_customers = rand(0..5)
        puts " customers to be served : #{num_customers}"
        num_customers.times do
            # Add the customer to the queue 
            @tellers.each do |teller|
                if !teller.is_busy?
                    #puts teller.teller_name
                    teller.add_queue(Customer.new(@time))
                end
            end
        end

        @tellers.each do |teller|
            #if teller line have a line and the teller is available meaning not busy
            #then pop the customer and serve it to the teller
            if teller.line_length > 0 && !teller.is_busy?
                #in this block we can serve the customer by popping
                #the customer form the queue means it is now being server
                #by the teller
                @current_customer_serving = teller.serve
                #puts "#{@current_customer_serving}"
            end

            if teller.is_busy?
                #this current_customer_serving contains the
                #product of random task and the telle speed
                current_load = @current_customer_serving - 1
                #implement the teller load (-1)
                #assign teller to be not busy after process
                if current_load == 0
                    teller.busy = false
                end
            end
        end
        
        @time += 1
      end
    end
    
end

# Run the simulation with 3 tellers
simulation = Simulation.new(10)
simulation.run
