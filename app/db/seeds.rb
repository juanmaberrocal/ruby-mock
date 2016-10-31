# create initial tasks
tasks = Task.create(
	# build array on the fly
	Array.new.tap do |task|
		# create 10 "random" tasks
		10.times do |i|
			task << {
				name: "Seeded Task #{i}",
				exc_path: "~/usr/seeded_tasks/exc_task_#{i}",
				start_datetime: (DateTime.now - (rand(0..10)).days),
				end_datetime: (DateTime.now + (rand(0..10)).days),
				exc_days: Task.random_exc_days, # method to generate random array
				server_key: SecureRandom.hex # generate random
			}
		end
	end
)

# create fake log data
TaskLog.create(
	# build array on the fly
	Array.new.tap do |log|
		# create 30 "random" logs
		30.times do |i|
			task = tasks[rand(0..9)] # get a seeded task record
			start_dt, end_dt, exc_time = TaskLog.random_exc_times(task) # method to generate random start|end|execution time
			log << {
				task_id: task.id,
				start_datetime: start_dt,
				end_datetime: end_dt,
				exc_time: exc_time,
				exc_status: TaskLog::EXC_STATUS[rand(0..1)] # get available status randomly
			}
		end
	end
)

# create demo agent
AgentClient.create(
	name: "Demo Agent",
	server_key: tasks.first.server_key
)