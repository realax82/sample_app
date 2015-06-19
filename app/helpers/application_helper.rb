module ApplicationHelper

    #return the full title on per-page basis
    def full_title(page_title)
	base_title="Ruby on Rails Tutorial Sample App"
	if page_title.empty?
	    base_title
	else
	    "#{base_title} | #{page_title}"
	end
    end

#есть предопределенная функция content_tag, которая работает)))
    def cnt_tag(tag,content,options={color:'red'})
	opt= options.any? ? options.to_s.gsub(/[{}>,:]/,' ') : ' '
	return "<#{tag} #{opt}>#{content}</#{tag}>"
    end
end
