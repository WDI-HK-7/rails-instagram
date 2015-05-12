json.array! @posts do |post|
  json.id post.id
  json.title post.title
  json.content post.content
  json.category post.category
  json.created_at post.created_at

  json.picture post.picture

  json.comments post.comments do |comment|
    json.content comment.content
    json.user_id comment.user_id
    json.created_at comment.created_at
  end
end