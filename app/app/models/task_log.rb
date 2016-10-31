class TaskLog < ActiveRecord::Base
	# ensure task has a name
	validates :task_id, presence: true

	# default order to id
	default_scope { order(id: :desc) }

	# log record is a child of a task
	belongs_to :task

	# keep control over available statuses reported
	EXC_STATUS = [
		"Success",
		"Fail"
	]

	# display executed process of log as the name of the associated task
	def exc_process
		self.task.name rescue 'No associated task!'
	end

	# used for SEEDING #
	# return array of random start datetime, end datetime, and excecution time in between
	def self.random_exc_times(task)
		start_dt = task.start_datetime + rand(0..10).days # limit random datetimes based on task
		end_dt = start_dt + (rand(0..24)).hours
		exc_time = (end_dt.to_i - start_dt.to_i) / 3600 # get time of execution in hours
		# return as array
		[start_dt, end_dt, exc_time]
	end
end
