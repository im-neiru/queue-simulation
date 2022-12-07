# Set the initial values for the simulation
tellers = 3
time = 1
MAX_CUSTOMERS = 10

# Create a dictionary to hold the time each teller takes to serve a customer
teller_speeds = {
  "A" => 1,
  "B" => 2,
  "C" => 3
}

task_types = {
  "normal" => 1,
  "heavy" => 2
}

# Create a queue to hold the customers
queue = Queue.new

# will the hold the amount of time each customer spends with each teller
times_spent_with_tellers = []


while times_spent_with_tellers.length < MAX_CUSTOMERS
  # create random number of customers lined
  num_customers = rand(5) + 1

  # Randomly assign tasks to the customers
  num_customers.times do
    task = "normal"
    if rand <= 0.15
      task = "heavy"
    end

    # Add the customer to the queue
    queue << {"time" => time, "task" => task}
  end

  # Check if any tellers are free and if there are any customers waiting in line
  if queue.length > 0 && tellers > 0
    #remove the next customer from the queue and calculate the amount of time they spend with a teller
    customer = queue.pop
    teller = teller_speeds.keys.sample
    time_spent = time - customer["time"]
    time_multiplier = task_types[customer["task"]]
    time_spent_with_teller = time_spent * time_multiplier

    puts "time #{time}, time spent #{time_spent_with_teller}, teller  #{teller}, task_type #{time_multiplier}"

    times_spent_with_tellers << time_spent_with_teller
    teller =- 1
  end

  # Increment the timer variable
  time += 1
end

puts times_spent_with_tellers