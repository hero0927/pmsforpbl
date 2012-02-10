class EAC_GraphFactory < GraphFactory
	def getGraphType
		return "EAC"
	end

	def getGraph(param)
		data     = Hash.new
		eac_arr  = Array.new
		date_arr = Array.new
		
		param[:evm].each do |evm|
			eac_arr.push(evm.eac)
			date_arr.push(evm.measured_date)
		end
		
		data["EAC"]   = eac_arr
		
		return data, date_arr
	end
end