json.array!(@joke_contents) do |joke_content|
  json.extract! joke_content, :id, :title, :content, :like_count, :dislike_count
  json.url joke_content_url(joke_content, format: :json)
end
