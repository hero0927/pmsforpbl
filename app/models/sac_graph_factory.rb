class SAC_GraphFactory < GraphFactory
	def getGraphType
		return "SAC"
	end

	def getGraph(param)
		data     = Hash.new
		sac_arr  = Array.new
		date_arr = Array.new
		
		param[:evm].each do |evm|
			sac_arr.push(evm.sac)
			date_arr.push(evm.measured_date)
		end
		
		data["SAC"]   = sac_arr
		
		return data, date_arr
	end
end