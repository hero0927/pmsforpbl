# プロジェクトを表すクラス
# 1/31 Daisuke KIKUCHI

class Project < User
	
	#ユーザ作成時の自動ログイン機能を無効にする
	acts_as_authentic do |c|
		c.maintain_sessions = false
	end
	
	#プロジェクトのトップページのURLを返すメソッド
	def gethomeurl
		return "/home/project"
	end
	
	def currentEvm
		current = nil
		self.currentRevision.each do |evm|
			break if evm.evAcNil?
			current = evm
		end
		return current
	end
	
	def currentRevision
		current_rev = []
		sorted_evms = evms.sort_by{|evm| evm.measured_date}
		current_rev << sorted_evms.shift
		sorted_evms.each do |evm|
			if current_rev.last.measured_date != evm.measured_date
				current_rev << evm
			elsif current_rev.last.revision < evm.revision
				current_rev.pop
				current_rev << evm
			end
			p current_rev
		end
		
		return current_rev
	end	
end