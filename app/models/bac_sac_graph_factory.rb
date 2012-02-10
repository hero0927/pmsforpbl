class BAC_SAC_GraphFactory < GraphFactory
	def getGraphType
		return "BAC,SAC"
	end

	def getGraph(param)
		data     = Hash.new
		bac_arr  = Array.new
		sac_arr  = Array.new
		date_arr = Array.new
		
		param[:evm].each do |evm|
			bac_arr.push(evm.bac)
			sac_arr.push(evm.sac)
			date_arr.push(evm.measured_date)
		end
		
		data["BAC"]  = bac_arr
		data["SAC"]  = sac_arr
		
		return data, date_arr
	end
end