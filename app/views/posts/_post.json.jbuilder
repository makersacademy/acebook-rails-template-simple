json.extract! post, :id, :date_created, :date_updated, :type, :image, :text, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)
