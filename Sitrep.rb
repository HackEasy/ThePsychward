require 'net/https'
require 'net/http'
require 'uri'
require 'colorize'

puts "Welcome To SitRep\n Your Friendly Neighbourhood Site Status Check"

print "Input Target Website: " .blue 
ip = gets.chomp

uri = URI.parse(ip)
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

request = Net::HTTP::Get.new(uri.request_uri)
response = http.request(request)
request = Net::HTTP::Get.new(uri.request_uri)
request.initialize_http_header({"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; de) Opera 8.0" => "My Ruby Script"})

puts response.code #=> "200"
puts response["location"] # All headers are lowercase

if response.code == "200"
    puts "[!] Site Is Up!\n".green

  elsif response.code == "301" or "302"
  	puts " Site Has Been Moved! \n".yellow
    
  elsif response.code == '400'
    puts "[*] Page Not Found! \n".orange
  else response.code == '500'
    puts "[*] Internal Server Error! \n".red
  end
