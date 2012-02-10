class Graph < SlideDatum
  def draw(xsize = 600, ysize = 430)
    ret      = String.new
    tmp      = String.new
        
    #凡例の入れ物
    @labels = []
    #グラフのデータを準備するための入れ物　
    @datas = []
    @ymax = []
    #日にち保存用の入れ物
    @measured_dates = []
    #グラフのプロットをうつための入れ物
    @graphdatas = []
    @tmp = []
         
    #凡例となる部分を抽出（pvとかevとかsvとか）し、@labelsに格納
    self.data.each_key do |key|
      @labels << key
    end
        
    #マネジメントデータを抽出
    self.data.each_value do |value|
      @datas << value
    end 
      
    #日付データを YYYY/MM/DDの形式で抽出
    self.measured_date.each do |day|
      @measured_dates << (day.year).to_s+"/"+(day.month).to_s+"/"+(day.day).to_s
    end
    @xmax = (7.days.since measured_date[measured_date.length-1])
    
    @datas.each do |data|        
      @graphdata = data
      @tmp=[]
      @measured_dates.each do |measured_date| 
        @tmp << measured_date
      end
      
      data_arr = []
      date_arr = []
      @graphdata.each_with_index do |graphdata,i|
        unless graphdata.nil? then
          if graphdata.class == Date
            data_arr << (graphdata.year).to_s+"/"+(graphdata.month).to_s+"/"+(graphdata.day).to_s
            date_arr << @tmp[i]
            
          else
            data_arr << @graphdata[i]
            date_arr << @tmp[i]
          end
        end
      end
      @graphdatas << date_arr.zip(data_arr)
    end
    
    
    print "-----------------------\n"
      p @graphdatas  
    print "-----------------------\n"
        
    ret = <<-EOS
 <div id='target_for_jqplot#{self.object_id}' style='width: #{xsize}px; height: #{ysize}px; margin: 10px'></div>
  <script type='text/javascript'>
  
    $.jqplot(
      'target_for_jqplot#{self.object_id}',    
           #{@graphdatas}
       ,
      {
         seriesDefaults: {
           pointLabels: {show: true}
         },
         series:[
    EOS
    ret << tmp
    
    #ラベル(凡例)の設定
    @labels.each_with_index do |label, i| 
       tmp = <<-EOS
         {label: '#{label}'}
       EOS
       ret << tmp
          
       print i
       if i != @labels.length-1
         ret = ret.chomp
         tmp = <<-EOS
,
         EOS
         ret << tmp
         
       end      
    end
    
    tmp = <<-EOS       
         ],
         legend: {
           show: true,
           location: 'n',
           placement: 'outside',
           align: 'left',
           margintop: -75, 
           renderer: $.jqplot.EnhancedLegendRenderer,
           rendererOptions: {
             numberColumns: 5
           }       
         },
         axes: {  
           xaxis: {
             renderer: $.jqplot.DateAxisRenderer,
             tickInterval: "7 days",
             min: "#{@measured_dates[0]}",
             max: "#{@xmax}",
             tickRenderer: $.jqplot.CanvasAxisTickRenderer,    
             tickOptions: {  
               angle: 22,
               fontSize: '8pt' 
             } 
           },
           yaxis:{
    EOS
    ret << tmp
       
    #完了予測日のときのみy軸の値も日付とし、最大値を日付＋１週間とする
    if @labels.index("Estimated_Completion_Date") != nil then
       tmp = <<-EOS
         renderer: $.jqplot.DateAxisRenderer
       EOS
       ret << tmp
    end
    
    if @labels.index("Estimated_Completion_Date") == nil then
      tmp =<<-EOS
            tickOptions:{
              formatString:'%.2f'
            }
      EOS
      ret << tmp
    end
    
    tmp =<<-EOS
           }  
         },
         seriesColors:[
          '#4648B8',  
          '#F92500',
          '#98fb98'
         ],
         cursor:{
           show: true,
           zoom:true,
           showTooltip:false
         }  
      }
      
    );
  </script>
    EOS
   ret << tmp
    
   return ret.html_safe
  end
end