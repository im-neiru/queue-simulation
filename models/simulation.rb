MAX_LINE_SIZE = 5
MAX_CUSTOMERS = 50

min_line_index = 0
min_line_size = MAX_LINE_SIZE

class Simulation
    def initialize
        @tellers = [Teller.new(0, "Teller A", 1), Teller.new(1, "Teller B", 2), Teller.new(2, "Teller C", 3)]
        @customer_counter = 0
        @minute = 0.0;
        @total_people_in_line = 0
        @total_processed_customers = 0
    end

    def shortest_teller
        min_line_index = 0
        min_time = 10000000000

        @tellers.each do |teller|
            if(teller.compute_time < min_time)
                min_time = teller.compute_time
                min_line_index = teller.teller_index
            end
        end

        #return rand(0...@tellers.length) if (@tellers.all? {|teller| teller.line_length == min_line_size})

        min_line_index
    end

    def enqueue_random()
        rand(1...5).times do
            customer = Customer.new(@customer_counter, rand <= 0.15 ? 2 : 1)
            @customer_counter += 1
            @tellers[shortest_teller].add_to_queue(customer, @minute)
        end
    end

    def dequeue()
        @tellers.each do |teller|
            serve_display = ""
            if(teller.is_process_done(@minute))
                @total_processed_customers += 1
                serve_display = "serve customer ##{teller.serve(@minute)}"
            else
            end
            teller.print
            puts serve_display
        end
        @minute += 1
    end

    def process()
        while (@total_processed_customers < MAX_CUSTOMERS)
            puts "\n********************"
            puts "     Minute #{@minute}"
            puts "     Served: #{@total_processed_customers}"
            puts "********************"
            if (Teller.total_people < MAX_CUSTOMERS)
                enqueue_random()
                puts "total people #{Teller.total_people}"
            else
                puts "CUTOFF"
            end

            dequeue()
        end
    end
end
