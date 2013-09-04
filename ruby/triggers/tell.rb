#!/usr/bin/env ruby

dest_nick = ARGV[0]
arg = ARGV[1]
chan = ARGV[2].split(" ")[2]

entries = IO.readlines("./data/telldb").uniq

for line in entries
    if line.split(" ")[0] == chan and line.split(" ")[2] == dest_nick

	message = line.split(' ').drop(3).join(' ')
	src_nick = line.split(' ')[1] 

	out = "#{dest_nick}: <#{src_nick}> #{message}"
	
	entries.delete(line)
    end
end

puts out

new = File.open("./data/telldb", "w")

for line in entries
    new.syswrite(line)
end

new.close
