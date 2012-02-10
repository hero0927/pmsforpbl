class CPI_GraphFactory < GraphFactory
	def getGraphType
		return "CPI"
	end

	def getGraph(param)
		data     = Hash.new
		cpi_arr  = Array.new
		date_arr = Array.new
		
		param[:evm].each do |evm|
			cpi_arr.push(evm.cpi)
			date_arr.push(evm.measured_date)
		end
		
		data["CPI"]   = cpi_arr
		
		return data, date_arr
	end
end