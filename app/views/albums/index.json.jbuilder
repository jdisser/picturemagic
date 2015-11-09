json.array!(@albums) do |album|
  json.extract! album, :id, :name, :description, :frntpg
  json.url album_url(album, format: :json)
end
