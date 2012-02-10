class SV_GraphFactory < GraphFactory
	def getGraphType
		return "SV"
	end

	def getGraph(param)
		data     = Hash.new
		sv_arr   = Array.new
		date_arr = Array.new
		
		param[:evm].each do |evm|
			sv_arr.push(evm.sv)
			date_arr.push(evm.measured_date)
		end
		
		data["SV"]   = sv_arr
		
		return data, date_arr
	end
end