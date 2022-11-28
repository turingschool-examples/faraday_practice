require 'faraday'
require 'pry'


connection = Faraday.new("https://pets-1.herokuapp.com")

## Get All Pets
response = connection.get("/api/v1/pets")
json_body = response.body
parsed_response = JSON.parse(json_body, symbolize_names: true)
binding.pry

## Get One Pet
response = connection.get("/api/v1/pets/202") # you can change this id if you'd like
json_body = response.body
parsed_response = JSON.parse(json_body, symbolize_names: true)
binding.pry

## Create a Pet
body = {
    "name": "Odell",
    "animal_type": "dog",
    "age": 9
  }
response = connection.post("/api/v1/pets") do |req|
    req.body = body
end 
json_body = response.body
parsed_response = JSON.parse(json_body, symbolize_names: true)
binding.pry

## Update a Pet
body = {
    "age": 10
  }
response = connection.put("/api/v1/pets/<<put id of existing pet here>>") do |req|
    req.body = body
end 
json_body = response.body
parsed_response = JSON.parse(json_body, symbolize_names: true)
binding.pry

## Delete a Pet
response = connection.delete("/api/v1/pets/<<put id of existing pet here>>")
json_body = response.body
binding.pry

