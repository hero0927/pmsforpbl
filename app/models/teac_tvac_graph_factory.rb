class TEAC_TVAC_GraphFactory < GraphFactory
	def getGraphType
		return "TEAC,TVAC"
	end

	def getGraph(param)
		data     = Hash.new
		teac_arr = Array.new
		tvac_arr = Array.new
		date_arr = Array.new
		
		param[:evm].each do |evm|
			teac_arr.push(evm.teac)
			tvac_arr.push(evm.tvac)
			date_arr.push(evm.measured_date)
		end
		
		data["TEAC"] = teac_arr
		data["TVAC"] = tvac_arr
		
		return data, date_arr
	end
end