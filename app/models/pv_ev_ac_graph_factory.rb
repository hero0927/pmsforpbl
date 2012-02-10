class PV_EV_AC_GraphFactory < GraphFactory
	def getGraphType
		return "PV,EV,AC"
	end

	def getGraph(param)
		data     = Hash.new
		pv_arr   = Array.new
		ev_arr   = Array.new
		ac_arr   = Array.new
		date_arr = Array.new
		
		param[:evm].each do |evm|
			pv_arr.push(evm.pv)
			ev_arr.push(evm.ev)
			ac_arr.push(evm.ac)
			date_arr.push(evm.measured_date)
		end
		
		data["PV"]   = pv_arr
		data["EV"]   = ev_arr
		data["AC"]   = ac_arr
		
		return data, date_arr
	end
end