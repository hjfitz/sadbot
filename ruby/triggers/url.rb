require 'open-uri'
require 'open_uri_redirections'
require 'pp'
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
    urls = URI.extract(input)				#extracts urls  
    file = open(urls[0], :allow_redirections => :safe) { |f|
        f.read =~ /<title>(.*?)<\/title>/ 
	if $1
            puts "Site Title: #{$1}"
        else
            puts "Type: #{f.meta['content-type']}; Size: #{humanise(f.meta['content-length'].to_i)}"
        end
    }
    
end
