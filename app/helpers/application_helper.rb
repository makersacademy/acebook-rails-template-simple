module ApplicationHelper
    #will format the date to this nice string call it using :nice_date
   def get_time_ago(datetime)
    return time_ago_in_words(datetime.to_s)
   end

end
