class BAC_GraphFactory < GraphFactory
	def getGraphType
		return "BAC"
	end

	def getGraph(param)
		data     = Hash.new
		bac_arr  = Array.new
		date_arr = Array.new
		
		param[:evm].each do |evm|
			bac_arr.push(evm.bac)
			date_arr.push(evm.measured_date)
		end
		
		data["BAC"]   = bac_arr
		
		return data, date_arr
	end
end