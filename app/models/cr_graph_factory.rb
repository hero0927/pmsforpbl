class CR_GraphFactory < GraphFactory
	def getGraphType
		return "CR"
	end

	def getGraph(param)
		data     = Hash.new
		cr_arr   = Array.new
		date_arr = Array.new
		
		param[:evm].each do |evm|
			cr_arr.push(evm.cr)
			date_arr.push(evm.measured_date)
		end
		
		data["CR"]   = cr_arr
		
		return data, date_arr
	end
end