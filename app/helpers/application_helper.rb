module ApplicationHelper

	def convert_array_to_str(arry)
		arry.to_s.gsub(/\"/, '\'').gsub(/[\[\]]/, '')
	end

end
