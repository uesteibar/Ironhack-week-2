
require "./formatter/standard_formatter"

class MultilineFormatter < StandardFormatter

	def center_horizontal(raw)
		left_spaces = number_of_left_spaces(raw)
		raw.split(/\n/).reduce("") do |result, line|
			result += (" " * left_spaces) + line + "\n"
		end
	end

	def number_of_left_spaces(raw)
		screen_width / 2  - raw.split(/\n/)[0].size / 2
	end
end
