class EstimatedCompletionDate_GraphFactory < GraphFactory
	def getGraphType
		return "Estimated Completion Date"
	end

	def getGraph(param)
		data      = Hash.new
		e_c_d_arr = Array.new
		date_arr  = Array.new
		
		param[:evm].each do |evm|
			e_c_d_arr.push(evm.estimated_completion_date)
			date_arr.push(evm.measured_date)
		end
		
		data["Estimated_Completion_Date"]   = e_c_d_arr
		
		return data, date_arr
	end
end