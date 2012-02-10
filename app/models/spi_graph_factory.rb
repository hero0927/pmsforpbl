class SPI_GraphFactory < GraphFactory
	def getGraphType
		return "SPI"
	end

	def getGraph(param)
		data     = Hash.new
		spi_arr  = Array.new
		date_arr = Array.new
		
		param[:evm].each do |evm|
			spi_arr.push(evm.spi)
			date_arr.push(evm.measured_date)
		end
		
		data["SPI"]   = spi_arr
		
		return data, date_arr
	end
end