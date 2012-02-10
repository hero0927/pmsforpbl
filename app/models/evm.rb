# EVM
# 1/31 Daisuke KIKUCHI

class Evm < ActiveRecord::Base
  belongs_to :user
  validates :pv,
      :numericality => { :greater_than_or_equal_to => 0 }
  validates :bac, :sac,
      :numericality => { :greater_than => 0 }
  
  def evAcNil?
    return false if self.ev and self.ac
    return true
  end
  
  def pvZero?
    return self.pv == 0
  end
  
  def acZero?
    return self.ac == 0
  end
  
  def evZero?
    return self.ev == 0
  end
  
  # 以下EVM指標の計算
  
  def sv
    return self.ev - self.pv unless evAcNil?
    return
  end
  
  def cv
    return self.ev - self.ac unless evAcNil?
    return
  end
  
  def spi(isCalledInEvm = false)
    unless evAcNil? or pvZero?
      return self.ev / self.pv if isCalledInEvm
      return self.ev / self.pv.round(2)
    else
      return
    end
    return
  end
  
  def cpi(isCalledInEvm = false)
    unless evAcNil? or acZero?
      return self.ev / self.ac if isCalledInEvm
      return self.ev / self.pv.round(2)
    else
      return
    end
    return
  end
  
  def cr
    return (self.spi(true) * self.cpi(true)).round(2) unless evAcNil? or pvZero? or acZero?
    return
  end
  
  def pc
    return (self.ev / self.bac * 100).round(2) unless evAcNil?
    return
  end
  
  def eac
    return (self.bac / self.cpi(true)).round(2) unless evAcNil? or acZero? or evZero?
    return
  end
  
  def tcpi
    return ((self.bac - self.ev) / (self.bac - self.ac)).round(2) unless evAcNil? or (self.bac - self.ac == 0)
    return
  end
  
  def teac(isCalledInEvm = false)
    unless evAcNil? or pvZero? or evZero?
      return self.sac / self.spi(true) if isCalledInEvm
      return self.sac / self.spi(true)
    else
      return
    end
    return
  end
  
  def tvac
    return (self.sac - self.teac).round(2) unless evAcNil? or pvZero? or evZero?
    return
  end
  
  def estimated_completion_date
    return user.project_stats_start_date + self.teac unless evAcNil? or pvZero? or evZero?
    return
  end
end
