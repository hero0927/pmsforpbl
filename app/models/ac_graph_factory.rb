class AC_GraphFactory < GraphFactory
	def getGraphType
		return "AC"
	end

	def getGraph(param)
		data     = Hash.new
		ac_arr   = Array.new
		date_arr = Array.new
		
		param[:evm].each do |evm|
			ac_arr.push(evm.ac)
			date_arr.push(evm.measured_date)
		end
		
		data["AC"]   = ac_arr
		
		return data, date_arr
	end
end