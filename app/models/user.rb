class User < ActiveRecord::Base
	has_many :evms
	has_one  :risk
	has_many :product_links
	
	#authlogicを用いることを宣言　必要であればオプションを追加することができる
  acts_as_authentic
  
  #子クラスにそれぞれ自分のホームページのURLを返すメソッドを定義する
  def gethomeurl
    
  end
	
end
