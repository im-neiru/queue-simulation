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
MAX_LINE_SIZE = 5
MAX_CUSTOMERS = 50

def task_type
    rand <= 0.15 ? 2 : 1
end

while (total_people_in_line <= MAX_CUSTOMERS)

    puts "\n********************"
    puts "     Minute #{minute}"
    puts "********************"

    min_line_index = 0
    min_line_size = MAX_LINE_SIZE

    num_customers = rand(0..5)
    #puts "random customer #{num_customers}"
    num_customers.times do
        #create a new customer
        #find the shortest line
        customer_number += 1

        (0...tellers.size).each do |i|
            if tellers[i].line_length < min_line_size
                min_line_size = tellers[i].line_length
                min_line_index = i
            end
        end

        #check if tellers are having the equals lines
        all_lines_equal = tellers.all? {|line_size| line_size == min_line_size}

        #check if lines are all equal or if the tellers line size are = 0
        #and after that get the teller index or position in the array
        teller_index = all_lines_equal || min_line_size == 0 ? rand(0..2) : min_line_index

        #get the teller
        current_teller = tellers[teller_index]

        if !current_teller.is_busy?
            customer = Customer.new(customer_number, task_type)
            #puts "Customer #{customer.customer_num} and task type #{customer.random_task_value} is added to line of #{current_teller.teller_name}"
            current_teller.add_to_queue(customer)
            
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
                total_people_in_line += 1
            end
        end

        puts "#{teller.teller_name} current load is #{teller.current_load}"
    end

    #puts "Customers served is #{total_processed_customers}"
    minute += 1
    puts "\n"
end

#  # Add the customer to the queue 
#  all_lines_equal = tellers.all? {|teller| line_size == min_line_size}

#  #check if lines are all equal or if the tellers line size are = 0
#  teller_index = all_lines_equal || min_line_size == 0 ? rand(0..2) : min_line_index

# tellers.each do |teller|
#     if !teller.is_busy? 
#         teller.add_to_queue(customer)
#     end
# end

# tellers.each do |teller|
#     if !teller.is_busy? #the teller is not busy
#         teller.add_to_queue(Customer.new(customer_number, task_type))
#     end
# end

# puts "#{teller.teller_name}"
# puts "Current customer proccessing time #{current_cus_time_to_finished}"
# puts "Current load #{teller.current_running_load}"
# puts "******"

#  #determine all the people who are already in line
#  tellers.each do |teller|
#     total_people_in_line += teller.line_length
# end


# if total_people_in_line <= max_customers
#     num_customers.times do |i|
#         tellers.each do |teller|
#             if !teller.is_busy?
#                 customer_number += i
#                 teller.add_queue(Customer.new(customer_number, task_type))
#             end
#         end
#     end
# else
#     puts "\n\nCUTOFF\n\n*"
# end