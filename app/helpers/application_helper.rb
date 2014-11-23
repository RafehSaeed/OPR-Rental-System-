module ApplicationHelper
	#Returns full title depending  on the page 
	def full_title(page_title = '')
		base_title = "OPR System"
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end

end
