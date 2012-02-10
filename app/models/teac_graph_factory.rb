class TEAC_GraphFactory < GraphFactory
	def getGraphType
		return "TEAC"
	end

	def getGraph(param)
		data     = Hash.new
		teac_arr  = Array.new
		date_arr = Array.new
		
		param[:evm].each do |evm|
			teac_arr.push(evm.teac)
			date_arr.push(evm.measured_date)
		end
		
		data["TEAC"]  = teac_arr
		
		return data, date_arr
	end
end