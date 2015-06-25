
require "terminfo"

class StandardFormatter

	def format(raw_text)
		return format_raw_text(raw_text)
	end

	def format_raw_text(raw_text)
		raw_text = center_horizontal(raw_text)
		raw_text = center_vertical(raw_text)
		return raw_text
	end

	def center_horizontal(raw_text)
		spaces_left = screen_width / 2  - raw_text.split(/\n/)[0].size / 2
		return (" " * spaces_left) + raw_text
	end

	def center_vertical(raw_text)
		lines_before = screen_height / 2
		return ("\n" * lines_before) + raw_text + ("\n" * lines_before)
	end

	def screen_size
		return TermInfo.screen_size
	end

	def screen_height
		return screen_size[0]
	end

	def screen_width
		return screen_size[1]
	end

end
