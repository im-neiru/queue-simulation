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

tellers = [Teller.new(0, "Teller A", 1), Teller.new(1, "Teller B", 2), Teller.new(2, "Teller C", 3)]

#customer_number = 
minute = 1;
total_people_in_line = 0
total_processed_customers = 0
current_cus_time_to_finished = 0

MAX_LINE_SIZE = 5
MAX_CUSTOMERS = 50

min_line_index = 0
min_line_size = MAX_LINE_SIZE

def task_type
    rand <= 0.15 ? 2 : 1
end

while (total_processed_customers <= MAX_CUSTOMERS) 

    puts "\n********************"
    puts "     Minute #{minute}"
    puts "********************"

    if (Teller.total_people <= MAX_CUSTOMERS)
        puts "total people #{Teller.total_people}"
        
        num_customers = rand(0...5)
        #puts "num of customers #{num_customers}"
        num_customers.times do |customer_number|

            tellers.each do |teller|
                if(teller.line_length < min_line_size)
                    min_line_size = teller.line_length
                    min_line_index = teller.teller_index
                end
            end

            #check if tellers are having the equals lines
            all_lines_equal = tellers.all? {|teller| teller.line_length == min_line_size}

            #check if lines are all equal or if the tellers line size are = 0
            #and after that get the teller index or position in the array
            teller_index = all_lines_equal || min_line_size == 0 ? rand(0...tellers.length) : min_line_index

            #get the teller
            current_teller = tellers[teller_index]

            puts current_teller.teller_name

            customer = Customer.new(customer_number, task_type)
            current_teller.add_to_queue(customer)
        end
    else
        puts "CUTOFF"
    end

    tellers.each do |teller|
        if teller.line_length > 0 && teller.busy == false
            current_cus_time_to_finished = teller.serve
        end

        #the teller is busy and currently serving a customer
        if teller.busy == true
            current_cus_time_to_finished -= 1
            #puts "#{current_cus_time_to_finished}"
            if current_cus_time_to_finished <= 0
                teller.busy = false
                total_processed_customers += 1
            end
        end

        puts "#{teller.teller_name} has #{teller.line_length} customers in line #{teller.current_load} load"
    end

    minute += 1
    puts "\n"
end
