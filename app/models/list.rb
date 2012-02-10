# スライドの最初の表の為のクラス
# 1/31 Daisuke KIKUCHI

class List < SlideDatum
  def draw
    ret  = String.new
    ret2 = String.new
    tmp  = String.new
    
    ret =<<-EOS
    <table border="1" width="90%" cellpadding="3" >
      <tr>
        <th>Team</th>
        <th>BAC</th>
        <th>SAC</th>
        <th>PV</th>
        <th>EV</th>
        <th>AC</th>
        <th>SV</th>
        <th>CV</th>
        <th>SPI</th>
        <th>CPI</th>
        <th>CR</th>
        <th>PC</th>
      </tr>
    EOS
    
    ret2 =<<-EOS
    <table border="1" width="90%" cellpadding="3">
      <tr>
        <th>Team</th>
        <th>PJ Start</th>
        <th>PJ Comp</th>
        <th>TCPI</th>
        <th>EAC</th>
        <th>TEAC</th>
        <th>TVAC</th>
        <th>Estimated Date</th>
      </tr>
    EOS
    
    data.each do |key, value|
      tmp =<<-EOS
      <tr>
        <th>#{key}</th>
      EOS
      value[:first].each do |v|
        tmp << "\t\t\t\t<th>#{v}</th>\n"
      end
      tmp << "\t\t\t</tr>\n"
      ret << tmp
      
      tmp = <<-EOS
      <tr>
        <th>#{key}</th>
      EOS
      value[:second].each do |v|
        tmp << "\t\t\t\t<th>#{v}</th>\n"
      end
      tmp << "\t\t\t</tr>\n"
      ret2 << tmp
    end
    ret  << "\t\t</table>\n<br>"
    ret2 << "\t\t</table>\n"
    
    ret << ret2
    
    return ret.html_safe
  end
end