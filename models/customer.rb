class Customer

    attr_reader :customer_num
    attr_reader :random_task_value

    def initialize (customer_num, random_task_value)
        #will set the name of the customer
        @random_task_value  = random_task_value
        @customer_num = customer_num
    end
end