require 'json'
require 'net/http'

if ARGV[0] == "" or ARGV[0] == " " then                                             #checks for argument
    puts "please input a query to translate"
else
    query = URI.encode(ARGV[0])                                 #encodes argument to html

    base_url = "http://translate.google.com/translate_a/t?client=p&ie=UTF-8&oe=UTF-8&sc=1&q=%s&sl=auto&tl=en" 
    uri = URI(base_url % query)
    resp = Net::HTTP.get_response(uri) #cops the json reply
        
    data = resp.body   
    result = JSON.parse(data)                                               #converts to a hash table
    puts result['sentences'][0]['trans']
end
