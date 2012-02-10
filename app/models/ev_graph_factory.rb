class EV_GraphFactory < GraphFactory
	def getGraphType
		return "EV"
	end

	def getGraph(param)
		data     = Hash.new
		ev_arr   = Array.new
		date_arr = Array.new
		
		param[:evm].each do |evm|
			ev_arr.push(evm.ev)
			date_arr.push(evm.measured_date)
		end
		
		data["EV"]   = ev_arr
		
		return data, date_arr
	end
end