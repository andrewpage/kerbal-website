module ApplicationHelper
	def cp(path)
		'active' if current_page?(path)
	end	
	
	def site_title(given)
		(given.nil? || given.blank?) ? Settings.general.site_title : (given + ' - ' + Settings.general.site_title_short)
	end

	def better_flash(type)
		switched = { :notice => :success, :alert => :danger }

		if switched.key?(type)
			switched[type]
		else
			type
		end
  end

  def nice_date(date)
    date.strftime('%B') + ' ' + date.strftime('%e').to_i.ordinalize + ' ' + date.strftime('%Y')
  end
end
