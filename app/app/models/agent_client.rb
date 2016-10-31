class AgentClient < ActiveRecord::Base
	# ensure agent has a name and key
	validates :name, :server_key, presence: true

	# agent belongs to a task (through server key)
	belongs_to :task, class_name: 'Task', foreign_key: 'server_key', primary_key: 'server_key'
end
