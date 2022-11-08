module HomeHelper
	require 'securerandom'

	def generate_number_of_likes
		number_to_human(rand(0..100), :format => '%n%u', :precision => 3, :units => { :thousand => 'K', :million => 'M', :billion => 'B' })
	end
end
