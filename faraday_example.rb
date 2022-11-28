require 'faraday'
require 'pry'


connection = Faraday.new("https://api.github.com")
response = connection.get("/users/mikedao")
json_body = response.body
parsed_response = JSON.parse(json_body, symbolize_names: true)
binding.pry
