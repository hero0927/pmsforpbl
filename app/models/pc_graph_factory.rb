class PC_GraphFactory < GraphFactory
	def getGraphType
		return "PC"
	end

	def getGraph(param)
		data     = Hash.new
		pc_arr   = Array.new
		date_arr = Array.new
		
		param[:evm].each do |evm|
			pc_arr.push(evm.pc)
			date_arr.push(evm.measured_date)
		end
		
		data["PC"]    = pc_arr
		
		return data, date_arr
	end
end