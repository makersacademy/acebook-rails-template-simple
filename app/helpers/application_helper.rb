module ApplicationHelper
  def convert_date(date)
    new_date = Date.strptime(date.to_s, '%Y-%m-%d %H:%M:%S ')
    new_date.strftime('%d-%m-%Y')

  end

  def less_than_a_day?(date)
    new_date = Time.parse(date.to_s)
    current_time = Time.now
    current_time - new_date <86400
  end

  def show_time(date)
    less_than_a_day?(date) ? "#{distance_of_time_in_words(Time.now, date)} ago" : convert_date(date)
  end

end
