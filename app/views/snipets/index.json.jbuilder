json.array!(@snipets) do |snipet|
  json.extract! snipet, :id, :title, :content, :execution_output
  json.url snipet_url(snipet, format: :json)
end
