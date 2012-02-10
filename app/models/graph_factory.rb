# スライドに格納するデータを作るクラス
# 1/31 Daisuke KIKUCHI

class GraphFactory < DataFactory
	
	def getSlideData(param)
		graph = Graph.new
		
		data, date_arr = getGraph(param)
		
		if data.nil?
			raise "[GraphFactory]Data is nil."
		end
		
		if date_arr.nil?
			raise "[GraphFactory]Measured_Date is nil."
		end
		
		graph.data          = data
		graph.measured_date = date_arr
		return graph
	end
	
	def getGraph(param)
		return nil, nil
	end
end
