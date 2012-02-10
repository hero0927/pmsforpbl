class TVAC_GraphFactory < GraphFactory
	def getGraphType
		return "TVAC"
	end

	def getGraph(param)
		data     = Hash.new
		tvac_arr = Array.new
		date_arr = Array.new
		
		param[:evm].each do |evm|
			tvac_arr.push(evm.tvac)
			date_arr.push(evm.measured_date)
		end
		
		data["TVAC"] = tvac_arr
		
		return data, date_arr
	end
end