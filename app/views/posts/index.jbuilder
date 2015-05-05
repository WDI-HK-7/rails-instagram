json.array! @posts do |post|
  json.title post.title
  json.content post.content
  json.category post.category
  json.created_at post.created_at
end