module ApplicationHelper
  def convert_date(date)
    new_date = Date.strptime(date.to_s, '%Y-%m-%d %H:%M:%S ')
    new_date.strftime('%d-%m-%Y')

  end

  def lessthanaday?(date)
    new_date = Time.parse(date.to_s)
    current_time = Time.now
    current_time - new_date > -86400
  end

  def showtime(date)
    
  end



end


# new method, pass the date (same as line 3, date object) and see if it lessthanaday?
# time.now gets current time, try to remove the date object (time deltas)
# if less than a day return true if > return false
# call the method and pass the string, if true show time if false show date
