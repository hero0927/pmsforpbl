# Listを作る為のクラス
# 1/31 Daisuke KIKUCHI

class ListFactory < DataFactory
	def getSlideData(param)
		list = List.new
		data = Hash.new
		param[:projects].each do |pj|
			evm = pj.currentEvm
			data[pj.team_name] = {:first =>  [evm.bac, evm.sac, evm.pv,  evm.ev, evm.ac, evm.sv,
								  evm.cv,  evm.spi, evm.cpi, evm.cr, evm.pc],
								  :second => [pj.project_start_date, pj.project_completion_date,
								  evm.tcpi, evm.eac, evm.teac, evm.tvac, evm.estimated_completion_date]
								 }
		end
		
		list.data = data
		return list
	end
end