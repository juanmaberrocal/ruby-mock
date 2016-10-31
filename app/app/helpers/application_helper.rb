module ApplicationHelper
	# get count of agents for layout display
	def agent_count
	  AgentClient.all.count
	end
end
