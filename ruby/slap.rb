#!/usr/bin/env ruby"

if ARGV[1].strip == "" 
    nick = ARGV[0]
else
    nick = ARGV[1].strip.split[0]
end

item = [
"doge",
"large trout",
"baseball bat",
"wooden cane",
"CRT monitor",
"diamond sword",
"physics textbook",
"television",
"jesus christ",
"feel",
"roll of duct tape",
"wild gentoo",
"master shill",
"lava bucket",
"rubber chicken",
"gold block",
"fire extinguisher",
"heavy rock",
"chunk of dirt"
]

slaps = [
"slaps #{nick} with a #{item.sample}.",
"slaps #{nick} around a bit with a #{item.sample}.",
"throws a #{item.sample} at #{nick}.",
"chucks a few #{item.sample}s at #{nick}.",
"grabs a #{item.sample} and throws it in #{nick}'s face.",
"launches a #{item.sample} in #{nick}'s general direction.",
"sits on #{nick}'s face while slamming a #{item.sample} into their crotch.",
"starts slapping #{nick} silly with a #{item.sample}.",
"holds #{nick} down and repeatedly whacks them with a #{item.sample}.",
"prods #{nick} with a flaming #{item.sample}.",
"picks up a #{item.sample} and whacks #{nick} with it.",
"ties #{nick} to a chair and throws a #{item.sample} at them.",
"hits #{nick} on the head with a #{item.sample}.",
"ties #{nick} to a pole and whips them with a #{item.sample}."
]

puts "[me]" + slaps.sample
