class TaskLog < ActiveRecord::Base
	# ensure task has a name
	validates :task_id, presence: true

	# default order to id
	default_scope { order(:id) }

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

	# used for DEMO #
	# return array of end datetime, and excecution time
	def exc_times
		start_dt = self.start_datetime
		end_dt = DateTime.now()
		exc_time = (end_dt.to_i - start_dt.to_i) / 3600 # get time of execution in hours
		# return as array
		[end_dt, exc_time]
	end
end
