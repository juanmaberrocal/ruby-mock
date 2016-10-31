class Task < ActiveRecord::Base
	# ensure task has a name
	validates :name, presence: true

	# serialize exc_days (from text -> array)
	serialize :exc_days, Array

	# default order to id
	default_scope { order(:name) }

	# tasks have many children log records
	has_many :task_logs, dependent: :destroy

	# tasks have many children agents (through server key)
	has_many :agent_clients, class_name: 'AgentClient', foreign_key: 'server_key', primary_key: 'server_key'

	# keep control over available days for task execution
	EXC_DAYS = [
		'Monday',
		'Tuesday',
		'Wednesday',
		'Thursday',
		'Friday',
		'Saturday',
		'Sunday'
	]

	# used for SEEDING #
	# create array of randomly chosen days for exc_days
	def self.random_exc_days
		# initialize array of days
		days = []
		# get a random number of days
		(rand(0..6)).times do |i|
			# get available day of the week randomly
			days << Task::EXC_DAYS[(rand(0..6))]
		end
		# return array of random days
		days.uniq # ensure only uniq days returned
	end
end
