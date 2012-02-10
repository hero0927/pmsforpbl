class ModelLogger
	def self.write(msg)
		p "*** Model Error: #{msg} ***"
		File.open('log/model_log.txt', 'a') do |f|
			f.write("#{Time.now}:#{msg}")
		end
	end
end