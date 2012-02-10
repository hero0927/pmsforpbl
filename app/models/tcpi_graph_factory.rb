class TCPI_GraphFactory < GraphFactory
	def getGraphType
		return "TCPI"
	end

	def getGraph(param)
		data     = Hash.new
		tcpi_arr  = Array.new
		date_arr = Array.new
		
		param[:evm].each do |evm|
			tcpi_arr.push(evm.tcpi)
			date_arr.push(evm.measured_date)
		end
		
		data["TCPI"]   = tcpi_arr
		
		return data, date_arr
	end
end