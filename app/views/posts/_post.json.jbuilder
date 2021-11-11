json.extract! post, :id, :post_type, :image, :text, :created_at, :updated_at
json.url post_url(post, format: :json)
