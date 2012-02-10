class Pmo < User
  #ユーザ作成時の自動ログイン機能を無効にする
  acts_as_authentic do |c|
    c.maintain_sessions = false
  end
  
  #PMOのトップページを返すメソッド 現在使用していない
  #/home/pmoに遷移する場合の例
  def gethomeurl
    return "/home/pmo"
  end
end