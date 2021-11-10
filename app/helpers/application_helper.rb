module ApplicationHelper
  def show_comments_with_correct_ordinal(number_of_comments)
    if number_of_comments == 1
      '1 comment'
    elsif number_of_comments == 0
      'No comments yet'
    else
      "#{number_of_comments} comments"
    end
  end
end
