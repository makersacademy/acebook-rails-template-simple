module ApplicationHelper
  def number_of_likes(num)
    if num == 0 
      return "no likes yet"
    elsif num == 1 
      return "One like"
    else
      return "#{num} likes"
    end
  end
end
