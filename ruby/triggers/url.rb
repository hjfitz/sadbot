require 'open-uri'
require 'net/http'

input = ARGV[1]

def humanise(len)
    if len < 1024
	return "#{len}B"
    elsif len >= 1024 and len < 1024*1024
	return "#{(len/1024.to_f).round(0)}KiB"
    elsif len >= 1024*1024
	return "#{(len/(1024*1024).to_f).round(1)}MiB"
    end
end

def remote_file_exists?(url)
    url = URI.parse(url)
    Net::HTTP.start(url.host, url.port) do |http|
        return http.head(url.request_uri).code == "200"
    end
end

if input =~ URI::regexp					#checks for url
    if remote_file_exists?(input) then
    	urls = URI.extract(input)				#extracts urls
    	open(urls[0]).read =~ /<title>(.*?)<\/title>/	#get title
    	file = open(urls[0])
    	if $1
	    puts "Site Title: #{$1}"
    	else
	    puts "Type: #{file.content_type}; Size: #{humanise(file.size)}"
        end					
    else
	puts "Site Title - Error: 404 file not found"
    end
end
