class SubmitLimitTimer < ActiveRecord::Base
  def get_weekday(day)
    if(day == "Sun")
    return 0
    elsif (day == "Mon")
    return 1
    elsif (day == "Tue")
    return 2
    elsif (day == "Wed")
    return 3
    elsif (day == "Thu")
    return 4
    elsif (day == "Fri")
    return 5
    elsif (day == "Sat")
    return 6
    end
  end

  # def get_evm_date
    # today_wday = Date.today.wday
    # step = today_wday - get_weekday(dead_line_weekday)
    # if(step > 0)
      # return Date.today - step, Date.today - step + 7
    # else
      # return Date.today - step - 7, Date.today - step
    # end
  # end

  def get_next_date
    today_wday = Date.today.wday
    wday_s = get_weekday(limit_weekday_start)
    wday_e = get_weekday(limit_weekday_end)
    if(wday_s < wday_e)
      if(today_wday > wday_e or today_wday < wday_s or(today_wday == wday_s and Time.now.hour < limit_time_start) or (today_wday == wday_e and Time.now.hour > limit_time_end))
        need_day = (wday_s + 7 - today_wday)%7
        return Time.parse(limit_time_start.to_s + ":00", Time.now + need_day.day), true
      else
        need_day = wday_e - today_wday
        return Time.parse(limit_time_end.to_s + ":00", Time.now + need_day.day), false
      end
    else
      if((wday_e < today_wday and today_wday < wday_s) or (today_wday == wday_s and Time.now.hour < limit_time_start) or (today_wday == wday_e and Time.now.hour > limit_time_end))
        need_day = wday_s - today_wday
        return Time.parse(limit_time_start.to_s + ":00", Time.now + need_day.day), true
      else
        need_day = (wday_e + 7 - today_wday)%7
        return Time.parse(limit_time_end.to_s + ":00", Time.now + need_day.day), false
      end
    end
  end
end
