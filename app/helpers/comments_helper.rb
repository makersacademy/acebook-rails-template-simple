module CommentsHelper

  def editable?(comment)
    Time.now - Time.parse(comment.created_at.to_s) <= 600
  end

  def do_not_run_js_in_test
    if ENV['RAILS_ENV'] == 'test'
      redirect_back(fallback_location: posts_path)
    else
      respond_to do |format|
        format.js
      end
    end
  end

end
