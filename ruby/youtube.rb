require 'json'
require 'net/http'
 
if not ARGV[0] then                                             #checks for argument
    puts "please input a query to search"
else
    query = URI.encode(ARGV[0])                                 #encodes argument to html
    base_url = "http://gdata.youtube.com/feeds/api/"                
    api_url = "#{base_url}videos/%s?v=2&alt=jsonc"                  #json url definitions
    search_url = "#{base_url}videos?v=2&alt=jsonc&max-results=1"
    v_url = "http://youtu.be/%s"
 
    resp = Net::HTTP.get_response(URI.parse("#{search_url}&q=#{query}"))    #cops the json reply
    data = resp.body
     
    result = JSON.parse(data)                                               #converts to a hash table

    if result.has_key? 'error'                                              #checks for errors
        raise "search service error"
    end

    if result['data']['totalItems'] == 0                                        #are there no results?
        puts "no results found"
    else
        search_id = result['data']['items'][0]['id']
        vid_r = Net::HTTP.get_response(URI.parse(api_url % search_id))
        data_r = vid_r.body                                                 #puts video id into second api
        result_r = JSON.parse(data_r)
        data = result_r['data']
        len = data['duration']
        if len / 3600 then
            hours = len / 3600
            if hours == 0 then                                              #format duration string
                hours = ""
            else
                hours = "#{hours}h:"
            end
        end
        if len / 60 then
            minutes = len / 60 % 60
        end
        duration = "#{hours}#{minutes}m:%ss" % (len % 60)
        views = data['viewCount'].to_s.reverse.gsub(/...(?=.)/,'\&,').reverse           #views string
        puts "[#{data['title']}] - [#{duration}] - [#{views} views] - #{v_url}" % search_id        #print final output
    end
end
