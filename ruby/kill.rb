#!/usr/bin/env ruby
# am stole from uguubot pls no sue

if ARGV[1].strip == ""
    nick = ARGV[0]
else
    nick = ARGV[1].strip.split[0]
end

kill = [
"rips off #{nick}'s legs and leaves them to die.",
"grabs #{nick}'s head and rips it clean off their body.",
"grabs a machine gun and riddles #{nick}'s body with bullets.",
"gags and ties #{nick} then throws them off a bridge.",
"crushes #{nick} with a huge spiked boulder.",
"glares at #{nick} until they die of boredom.",
"shivs #{nick} in the heart a few times.",
"rams a rocket launcher up #{nick}'s ass and lets off a few rounds.",
"crushes #{nick}'s skull in with a spiked mace.",
"unleashes the armies of Isengard on #{nick}.",
"gags and ties #{nick} then throws them off a building to their death.",
"reaches out and punches right through #{nick}'s chest.",
"slices #{nick}'s limbs off with a sharpened Katana.",
"throws #{nick} to Cthulu and watches them get ripped to shreds.",
"feeds #{nick} to an owlbear who then proceeds to maul them violently.",
"turns #{nick} into a snail and salts them.",
"snacks on #{nick}'s dismembered body.",
"stuffs some TNT up #{nick}'s ass and waits for it to go off.",
"puts #{nick} into a sack, throws the sack in the river, and hurls the river into space.",
"goes bowling with #{nick}'s bloody disembodied head.",
"sends #{nick} to /dev/null!",
"feeds #{nick} coke and mentos till they violently explode."
]

puts "[me]" + kill.sample
