class Teller

    attr_reader :teller_name
    attr_reader :teller_speed
    attr_reader :teller_index
    attr_accessor :busy

    @@total_people_in_line = 0

    def initialize(teller_index, teller_name, teller_speed)
        @customers_line = Array.new #line for the customers

        @teller_index = teller_index
        @teller_name = teller_name
        @teller_speed = teller_speed
        #initilize the tellers as not busy
        @busy = false
    end

    def self.total_people
        @@total_people_in_line
    end

    def line_length
        @customers_line.empty? ? 0 : @customers_line.length
    end
    
    def is_busy?
        @busy
    end

    def set_status(status)
        @busy = status
    end

    #meaning this is the current execution time of a teller to 
    #serve a customer
    def current_load #this is the load of the backline
        @customers_line.length * @teller_speed
    end

    #add the customer to the line
    def add_to_queue(customer)
        @@total_people_in_line += 1
        @customers_line << customer
    end

    #serve the customer and exit the customer after the
    #task on hand is done
    def serve
        @busy = true
        customer = @customers_line.shift #isserve na
        #current time teller current na tgsserve kang teller
        customer.random_task_value * @teller_speed 
    end
end