module ApplicationHelper

	#�������ڵ�ҳ�淵�������ı���
	def full_title(page_title='')
		base_title = "Rails Girls"
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end
end