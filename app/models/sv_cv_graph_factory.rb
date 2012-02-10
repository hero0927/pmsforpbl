class SV_CV_GraphFactory < GraphFactory
	def getGraphType
		return "SV,CV"
	end

	def getGraph(param)
		data     = Hash.new
		sv_arr   = Array.new
		cv_arr   = Array.new
		date_arr = Array.new
		
		param[:evm].each do |evm|
			sv_arr.push(evm.sv)
			cv_arr.push(evm.cv)
			date_arr.push(evm.measured_date)
		end
		
		data["SV"]   = sv_arr
		data["CV"]   = cv_arr
		
		return data, date_arr
	end
end