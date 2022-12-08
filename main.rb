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

tellers = [Teller.new("Teller A", 1), Teller.new("Teller B", 2), Teller.new("Teller C", 3)]

customer_number = 0
current_cus_time_to_finished = 0
minute = 1;
total_people_in_line = 0
total_processed_customers = 0
MAX_LINE_SIZE = 5
MAX_CUSTOMERS = 50
min_line_index = 0
min_line_size = MAX_LINE_SIZE

def task_type
    rand <= 0.15 ? 2 : 1
end

while true

    puts "\n********************"
    puts "     Minute #{minute}"
    puts "********************"

    if (Teller.total_people < MAX_CUSTOMERS)
        num_customers = rand(0..5)
        num_customers.times do
            #create a new customer
            #find the shortest line
            customer_number += 1
            total_people_in_line += 1
            (0...tellers.size).each do |i|
                if tellers[i].line_length <= min_line_size
                    min_line_size = tellers[i].line_length
                    min_line_index = i
                end
            end

            #check if tellers are having the equals lines
            all_lines_equal = tellers.all? {|line_size| line_size.line_length == min_line_size}

            #check if lines are all equal or if the tellers line size are = 0
            #and after that get the teller index or position in the array
            teller_index = all_lines_equal || min_line_size >= 0 ? rand(0...tellers.length) : min_line_index

            #get the teller
            current_teller = tellers[teller_index]

            if !current_teller.is_busy?
                customer = Customer.new(customer_number, task_type)
                #puts "Customer #{customer.customer_num} and task type #{customer.random_task_value} is added to line of #{current_teller.teller_name}"
                current_teller.add_to_queue(customer)
            end
        end
    end

    tellers.each do |teller|
        if teller.line_length > 0 && !teller.is_busy?
            current_cus_time_to_finished = teller.serve
        end

        #the teller is busy and currently serving a customer
        if teller.is_busy?
            current_cus_time_to_finished -= 1
            if current_cus_time_to_finished == 0
                teller.busy = false
                total_processed_customers += 1
            end
        end

        puts "#{teller.teller_name} with current line of #{teller.line_length}"
    end

    if (total_processed_customers == MAX_CUSTOMERS)
        break
    end

    #puts "Customers served is #{total_processed_customers}"
    minute += 1
    puts "\n"
end