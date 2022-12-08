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

total_processed_customers = 0
customer_number = 0
current_cus_time_to_finished = 0
max_customers = 50
minute = 1;
total_people_in_line = 50

def task_type
    rand <= 0.15 ? 2 : 1
end

while (total_processed_customers <= max_customers)

    puts "\n********************"
    puts "     Minute #{minute}"
    puts "********************"

    num_customers = rand(0..5)
    num_customers.times do |i|
        tellers.each do |teller|
            if !teller.is_busy?
                customer_number += i
                teller.add_queue(Customer.new(customer_number, task_type))
            end
        end
    end

    tellers.each do |teller|
        if teller.line_length > 0 && !teller.is_busy?
            current_cus_time_to_finished = teller.serve
        end

        if teller.is_busy?
            current_cus_time_to_finished -= 1
            if current_cus_time_to_finished == 0
                teller.busy = false
                total_processed_customers += 1
            end
        end
    end

    #puts "total oki customers: #{total_processed_customers}"

    minute += 1
    puts "\n"
end

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