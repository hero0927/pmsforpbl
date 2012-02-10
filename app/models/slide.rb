class Slide < ActiveRecord::Base
  belongs_to :user
  belongs_to :presentation
  belongs_to :slide_template, :autosave => true
  belongs_to :presentation_template, :autosave => true
  has_many   :slide_data, :autosave => true
  
  # make
  # スライドを作成するメソッド
  # Parameters
  # [Hash]param => :evm  スライドのグラフ用データを作る為のEVMデータ
  #                :page スライドのページ番号
  #
  def make(param)
    if param[:page].nil?
      raise "[Slide.make]Page is nil"
    end
    
    if param[:project].nil?
      raise "[Slide.make]Project is nil"
    end
    
    if param[:slide_template].nil?
      raise "[Slide.make]Slide_Template is nil"
    end
    
    self.page           = param[:page]
    self.user           = param[:project]
    self.slide_template = param[:slide_template]
    param[:evm]         = self.user.currentRevision
    self.slide_data     = slide_template.getSlideData(param)
  end
  
  # makeList
  # 最初のスライドを作成するメソッド
  # Parameters
  # [Hash]param => :projects 今回の発表資料に含むプロジェクトの配列
  def makeList(param)
    if param[:projects].nil?
      raise "[Slide.makeList]Projects are nil."
    end
    self.page = 1
    factory = ListFactory.new
    self.slide_data << factory.getSlideData(param)
  end
  
  # draw
  # スライドを描画するためのスクリプトを生成するメソッド
  def draw
    ret = "<center>page #{self.page}</center>\n"
    ret << "<center><h3>It's a Comment!!<h3></center>\n"
    ret << self.drawWithoutComment
    return ret.html_safe
  end
  
  def drawWithoutComment
    ret = "<center>\n<table>\n"
    self.slide_data.each_with_index do |data, i|
      if i % 2 == 0
        ret << "<tr>\n"
      end
      ret << "<td>\n#{data.draw}</td>\n"
      if i % 2 == 1
        ret << "</tr>\n"
      end
    end
    ret << "</table>\n</center>\n"
    return ret.html_safe
  end
end
