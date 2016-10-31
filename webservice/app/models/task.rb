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
end
