class SPI_CPI_CR_GraphFactory < GraphFactory
	def getGraphType
		return "SPI,CPI,CR"
	end

	def getGraph(param)
		data     = Hash.new
		spi_arr  = Array.new
		cpi_arr  = Array.new
		cr_arr   = Array.new
		date_arr = Array.new
		
		param[:evm].each do |evm|
			spi_arr.push(evm.spi)
			cpi_arr.push(evm.cpi)
			cr_arr.push(evm.cr)
			date_arr.push(evm.measured_date)
		end
		
		data["SPI"]  = spi_arr
		data["CPI"]  = cpi_arr
		data["CR"]   = cr_arr
		
		return data, date_arr
	end
end