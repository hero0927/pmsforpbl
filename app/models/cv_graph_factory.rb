class CV_GraphFactory < GraphFactory
	def getGraphType
		return "CV"
	end

	def getGraph(param)
		data     = Hash.new
		cv_arr   = Array.new
		date_arr = Array.new
		
		param[:evm].each do |evm|
			cv_arr.push(evm.cv)
			date_arr.push(evm.measured_date)
		end
		
		data["CV"]   = cv_arr
		
		return data, date_arr
	end
end