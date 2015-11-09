json.array!(@pictures) do |picture|
  json.extract! picture, :id, :title, :caption, :picurl
  json.url picture_url(picture, format: :json)
end
