module ApplicationHelper
  def site_title(given)
  	(given.nil? || given.blank?) ? Settings.general.site_title : (given + ' - ' + Settings.general.site_title_short)
  end
end
