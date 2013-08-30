require 'net/http'
require 'fastimage'

file = ARGV[0]

file = FastImage.size(ARGV[0])
type = FastImage.type(ARGV[0])

Net::HTTP.start(ARGV[0].split('/')[2]) do |http|
    response = http.request_head(URI.escape(ARGV[0]))
    resp = response['content-length'].to_i
    fsize = resp / 1024

    puts "res: " + file[0].to_s + "x" + file[1].to_s + " | size: " + fsize.to_s + "KB" + " | type: image/" + type.to_s + " ]"
end
