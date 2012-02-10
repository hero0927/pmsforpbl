class PV_GraphFactory < GraphFactory
	def getGraphType
		return "PV"
	end

	def getGraph(param)
		data     = Hash.new
		pv_arr   = Array.new
		date_arr = Array.new
		
		param[:evm].each do |evm|
			pv_arr.push(evm.pv)
			date_arr.push(evm.measured_date)
		end
		
		data["PV"] = pv_arr
		return data, date_arr
	end
end