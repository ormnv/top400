module ShowsHelper

	# Gets the time of the next show
	def next_show_time
		now = DateTime.current
		if now.cweek % 2 == 0 
			week_of_show = now.at_beginning_of_week
		else
			week_of_show = now.next_week.at_beginning_of_week
		end
		next_show_start = week_of_show - 2.hours
		next_show_start.strftime("%A, %B %d @ %H:00")
	end
end
