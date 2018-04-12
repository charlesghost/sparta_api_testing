require 'httparty'

response = HTTParty.get('http://bbc.co.uk/news')


puts response
puts response.code
puts response.message