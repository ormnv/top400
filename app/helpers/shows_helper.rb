module ShowsHelper

	# Gets the time of the next show
	def next_show_time
		now = DateTime.current
		if now.cweek % 2 == 0 
			week_of_show = now.at_beginning_of_week
		else
			week_of_show = now.next_week.at_beginning_of_week
		end
		
		last_show_start = week_of_show - 2.hours
		last_show_end = week_of_show
		next_show_start = last_show_start + 14.days
		next_show_end = last_show_start + 2.hours

		if now > last_show_start && now < last_show_end
			next_show_date = last_show_start
		elsif now > next_show_start && now < next_show_end
			next_show_date = next_show_start
		else
			next_show_date = next_show_start
		end
		next_show_date
	end
end
