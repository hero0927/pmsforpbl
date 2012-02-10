class EvmController < ApplicationController
    #layout 'project_layout'
    before_filter :require_user
  def index
    @project = @current_user
    
      
    #EVM指標配列の分割

    @renderable = nil
    @evms = @project.currentRevision
    
    unless @evms[0].nil?
      param = {:evm => @evms}
      @pvevac_f = PV_EV_AC_GraphFactory.new
      @pvevac = @pvevac_f.getSlideData(param) #Viewで使用
      @svcv_f = SV_CV_GraphFactory.new
      @svcv = @svcv_f.getSlideData(param) #Viewで使用      
      @spicpicr_f = SPI_CPI_CR_GraphFactory.new
      @spicpicr = @spicpicr_f.getSlideData(param) #Viewで使用      
      @pc_f = PC_GraphFactory.new
      @pc = @pc_f.getSlideData(param) #Viewで使用      
      @tcpi_f = TCPI_GraphFactory.new
      @tcpi = @tcpi_f.getSlideData(param) #Viewで使用      
      @teactvac_f = TEAC_TVAC_GraphFactory.new
      @teactvac = @teactvac_f.getSlideData(param) #Viewで使用      
      @eac_f = EAC_GraphFactory.new
      @eac = @eac_f.getSlideData(param) #Viewで使用  
      @estimatedcompletiondate_f = EstimatedCompletionDate_GraphFactory.new
      @estimatedcompletiondate = @estimatedcompletiondate_f.getSlideData(param) #Viewで使用 
      @bac_f = BAC_GraphFactory.new
      @bac = @bac_f.getSlideData(param) #Viewで使用      
      @sac_f = SAC_GraphFactory.new
      @sac = @sac_f.getSlideData(param) #Viewで使用 
      
      @cnum = 7  #テーブルの列数
      @tables = [] #Viewで使用
      while @evms.size!=0 do
        @tables << @evms.slice!(0,@cnum)
      end
      
      @today = Date.new(2011,12,15)
      @open = @project.project_stats_start_date
      @nextdate = @open
      while @nextdate < @today
        @nextdate += 7
      end
      
      @unreported_dates = []
      @checkevms = @project.currentRevision
      @checkevms.each do |evm|
        if (evm.measured_date < @today && evm.evAcNil?)
          @unreported_dates.unshift(evm.measured_date)
        end
      end
      @unreported_dates.unshift(@nextdate)
      
      
      #EVAC提出ポップアップ用
      @evm = Evm.new  #EV,AC提出フォーム用  Viewで使用    
      @renderable = true
    else
      @renderable = false
    end
  end

  def registration
    @project = @current_user
    #///////////データ統計日を含むEVM登録フォームの生成
    @today = Date.new(2011,10,30) #アクセス日を設定
    @open = @project.project_stats_start_date#プロジェクトの統計開始日を設定
    @close = @project.project_completion_date #プロジェクトの終了日を設定
    @alldate = [] #EVM登録フォームの全統計日の配列　Viewで使用
    
    ######################
    @nums = 0
    #####################3
    
    @first_registration = false
    if @project.evms[0].nil?
      @first_registration = true
    end
    
    #終了日の次の統計日までの枠を生成
    @date = @open
    p @date
    p @close
    @alldate << @date
    while @date < @close
      @alldate << @date = @date+7
    end
    
    #EVM統計日配列の分割
    @cnum = 7 #テーブルの列数
    @dates = [] #Viewで使用
    while @alldate.size!=0 do  #///テーブルの列数に対応した日付の配列を作成
      @dates << @alldate.slice!(0,@cnum)
    end
  end

  def confirm
    #初めに、registrationから渡された入力値のvaridationを実施する。
    #Evmモデルのvaridateを利用するため、一かいEvmインスタンスにデータを格納してみて
    #関数 varid?により判定。一つでも間違いがある場合、グラフ描画などの前に前のページへ
    #リダイレクトする。
    
    #varid?で問題なければ、確認のテーブルやグラフを描画。
    #実際に値を格納するために次のアクションへ値をわたす。その為の送信フォームを作成（hidden）
    @project = @current_user
    @today = Date.new(2011,10,30) #アクセス日を設定
    @open = @project.project_stats_start_date#プロジェクトの統計開始日を設定
    @close = @project.project_completion_date #プロジェクトの終了日を設定
    
    @first_registration = false
    if @project.evms[0].nil?
      @first_registration = true
    end
        
    @past_dates = []
    @future_dates = []
    
    @date = @open
    
    if  @today <= @date || @first_registration
      @future_dates << @date
      while @date < @close
        @future_dates << @date += 7
      end
    else
      @past_dates << @date
      while @date < @today -7
        @past_dates << @date += 7
      end
      while @date < @close
        @future_dates << @date += 7
      end
    end
    
    
    
    ######################
    @past_test = @past_dates.clone
    ######################
    ######################
    @future_test = @future_dates.clone
    ######################
    
     # @measured_dates = @alldate #後で使う    
    @new_revisions = []
    @pvs = params[:pvs]
   
    while @pvs.size!=0 do
      @evm = Evm.new
      @evm.measured_date = @future_dates.shift
      @evm.pv = @pvs.shift
      @evm.bac = params[:bac]
      @evm.sac = params[:sac]
      if @evm.valid?
        @new_revisions << @evm
      else
        redirect_to :action => "registration"
        return
      end
    end
    
    @allevms = []
    unless @first_registration
      @old_revisions = @project.currentRevision
      @past_dates.size.times{
        @allevms << @old_revisions.shift
      }
    end
    
    @new_revisions_cp = @new_revisions.clone
    @newrev_num = @new_revisions.size
    @newrev_num.times{
      @allevms << @new_revisions_cp.shift
    }
    
    @cnum = 12
    @allevms_cp = @allevms.clone
    @tables = []
    while @allevms_cp.size != 0
      @tables << @allevms_cp.slice!(0,@cnum)
    end
    
    param = {:evm => @allevms}
    @pv_f = PV_GraphFactory.new
    @pv = @pv_f.getSlideData(param) #Viewで使用
    @bac_f = BAC_GraphFactory.new
    @bac = @bac_f.getSlideData(param) #Viewで使用
    @sac_f = SAC_GraphFactory.new
    @sac = @sac_f.getSlideData(param) #Viewで使用
    
  end
  
  def create
    @evm = Evm.new(params[:evm])
    
      if @evm.save 
        redirect_to :action => 'index'
        return
      else
        render :action => 'registration' 
        return
      end
  end
  
  def test
    #confirmから遷移する。
    #ここは特に固有のビューはなく、送られたデータを基にEvmオブジェクトを量産して、値を格納していく。
    #一応、この段階でも最終確認としてvaridを実施する。
    #駄目なら、confirm画面に戻してやる。良ければ、
    #作ったEvmオブジェクトの配列をProjectオブジェクトのEvmsに渡すことでDBへの書き込みも終了。
    #その後、index画面へリダイレクト
    
    @params = params
    @dates = params[:dates]
    @pvs = params[:pvs]
    @bacs = params[:bacs]
    @sacs = params[:sacs]
    @evms = []
    
    @newrevision = 0
    @project = @current_user
    @current = @project.evms.order('revision desc').first
    if @current.nil?
      @newrevision = 1
    else
      @newrevision = @current.revision + 1
    end
    while @dates.size != 0
      @evm = Evm.new
      @evm.user_id = @project.id
      @evm.revision = @newrevision
      @evm.measured_date =@dates.shift
      @evm.pv = @pvs.shift
      @evm.bac = @bacs.shift
      @evm.sac = @sacs.shift
        unless @evm.valid?
          redirect_to :action => "registration"
          return
          @test = "false"
        end
      @evms << @evm
    end
    
    @project.evms << @evms
    redirect_to :action => "index"
    return
  end
  
  def update  #evac提出のやつ
    @project = @current_user
    @today = Date.new(2011,12,10)
    @open = @project.project_stats_start_date#プロジェクトの統計開始日を設定
    @nextdate = @open
    
    while @nextdate < @today #アクセス日の次の統計日を調べる
      @nextdate += 7
    end
    
    @project = @current_user
    @params = params
    @evm = @project.evms.where(:measured_date =>params[:evm][:measured_date]).order('revision desc').first
    @evm.ev = params[:evm][:ev]
    @evm.ac = params[:evm][:ac]
    if @evm.save
      redirect_to :action => "index"
      return
    else
      redirect_to :action => "update"
      return
    end
  end
  
  def conf_test
    @params = params
  end
    

end
