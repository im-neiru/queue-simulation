class Teller 

    attr_reader :teller_name
    attr_reader :teller_speed
    attr_reader :time_it_takes
    attr_writer :busy

    def initialize(teller_name, teller_speed)
        @customers_line = Queue.new #line for the customers

        @teller_speed = teller_speed
        @teller_name = teller_name

        @time_it_takes = 0
        #initilize the tellers as not busy
        @busy = false
    end

    def line_length
        @customers_line.length
    end
  
    def is_busy?
        @busy
    end

    #meaning this is the current execution time of a teller to 
    #serve a customer
    def current_running_load #this is the load of the backline
        #puts "len  #{@customers_line.length}"
        @time_it_takes = @customers_line.length * @teller_speed
        #puts "time it takes #{@time_it_takes}"
    end

    #add the customer to the line
    def add_queue(customer)
        @customers_line.push(customer)
    end
    
    #serve the customer and exit the customer after the
    #task on hand is done
    def serve
        @busy = true

        customer = @customers_line.pop #isserve na
        #puts "customer #{customer.customer_num}"
        #current time teller current na tgsserve kang teller
        customer.random_task_value * @teller_speed 
    end
end