#!/usr/bin/ruby
require 'net/https'
require 'uri'
require 'colorize'

print "Input Target: ".blue
uri = gets.chomp

URI.parse(uri)

# Shortcut
response = Net::HTTP.get_response(uri)

# Will print response.body
Net::HTTP.get_print(uri)

# Full
http = Net::HTTP.new(uri.host, uri.port)
response = http.request(Net::HTTP::Get.new(uri.request_uri))
