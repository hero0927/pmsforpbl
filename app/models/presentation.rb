# プレゼンテーション
# 1/31 Daisuke KIKUCHI

class Presentation < ActiveRecord::Base
	has_many :slides, :autosave => true
	
	# make
	# プレゼンテーションを作成するメソッド
	# Parameter:
	# [Hash]param => :projects              この資料に含めるプロジェクトの配列
	#                :presentation_template この資料に適用するプレゼンテーションテンプレート
	def make(param)
		begin
			if param[:project_type].nil?
				raise "[Presentation]Project type is nil."
			end
			
			if param[:presentation_template].nil?
				raise "[Presentation]Presentation_Template is nil."
			end
			
			if param[:project_type] != "pbl" and param[:project_type] != "rdp"
				raise "[Presentation] Project type is undefined."
			end
			
			self.project_type = param[:project_type]
			param[:projects] = Project.find_all_by_project_type_and_project_state(param[:project_type], "run")
			
			slide = Slide.new
			slide.makeList(param)
			self.slides << slide
			i = 2
			param[:projects].each do |pj|
				param[:presentation_template].slide_templates.each do |tmp|
					slide = Slide.new
					param[:page] = i
					param[:project] = pj
					param[:slide_template] = tmp
					slide.make(param)
					self.slides << slide
					i += 1
				end
			end
			self.save
		rescue => ex
			ModelLogger.write(ex.message)
		end
	end
end
