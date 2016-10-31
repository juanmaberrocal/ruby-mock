class DashboardController < ApplicationController

	def index
		# build hash for "calendar" type view based on day
		@tasks_per_day = Hash.new.tap do |day_map|
			Task::EXC_DAYS.each do |day|
				day_map[:"#{day}"] = []
			end
		end

		# get all tasks and fill map
		Task.all.each do |task|
			task.exc_days.each do |day|
				@tasks_per_day[:"#{day}"] << task
			end
		end
	end

end