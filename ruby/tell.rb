#!/usr/bin/env ruby

chan = ARGV[2].split(" ")[2]
src_nick = ARGV[0].strip()
input = ARGV[1].strip()

if not File::exists?("./data/telldb")
    File.new("./data/telldb", "w")
end

f = File.open("./data/telldb", "a")
dest_nick = input.split(' ')[0]
message = input.split(' ').drop(1).join(' ')
f.syswrite("#{chan} #{src_nick} #{dest_nick} #{message}\n")

puts "I'll pip that to #{dest_nick} for you"    
