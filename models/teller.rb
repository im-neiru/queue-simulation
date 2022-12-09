class Teller

    attr_reader :teller_name
    attr_reader :teller_speed
    attr_reader :teller_index

    @@total_people_in_line = 0

    def initialize(teller_index, teller_name, teller_speed)
        @customers_line = Array.new #line for the customers

        @teller_index = teller_index
        @teller_name = teller_name
        @teller_speed = teller_speed
        @wait_start = 0.0
        #initilize the tellers as not busy
        @busy = false
    end

    def print
        line = ""
        @customers_line.each do |customer|
            line += " . " + customer.customer_num.to_s
        end
        puts "#{@teller_name} [#{line}]"
    end

    def is_process_done(minutes)
        return false if(@customers_line.length == 0)
        span = minutes - @wait_start
        cost_time = @customers_line.first().random_task_value * @teller_speed.to_f()
        span >= cost_time
    end

    def self.total_people
        @@total_people_in_line
    end

    def line_length
        @customers_line.empty? ? 0 : @customers_line.length
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
    def add_to_queue(customer, minutes)
        if (@customers_line.length == 0)
            @wait_start = minutes
        end

        @@total_people_in_line += 1
        @customers_line.push(customer)
    end

    #serve the customer and exit the customer after the
    #task on hand is done
    def serve(minutes)
        customer = @customers_line.shift #isserve na
        @wait_start = minutes
        customer.customer_num
    end
end
