#!/usr/bin/env ruby
# am stole from uguubot pls no sue

if ARGV[1].strip == "" 
    nick = ARGV[0]
else
    nick = ARGV[1].strip.split[0]
end

wreck = [
"smacks #{nick} in the face with a burlap sack full of broken glass.",
"swaps #{nick}'s shampoo with glue.",
"installs Windows on #{nick}'s computer.",
"forces #{nick} to use perl for 3 weeks.",
"registers #{nick}'s name with 50 known spammers.",
"resizes #{nick}'s console to 40x24.",
"takes #{nick}'s drink.",
"dispenses #{nick}'s email address to a few hundred 'bulk mailing services'.",
"pokes #{nick} in the eye.",
"beats #{nick} senseless with a 50lb Linux manual.",
"cats /dev/random into #{nick}'s ear.",
"signs #{nick} up for AOL.",
"downvotes #{nick} on Reddit.",
"enrolls #{nick} in Visual Basic 101.",
"sporks #{nick}.",
"drops a truckload of support tickets on #{nick}.",
"judo chops #{nick}.",
"sets #{nick}'s resolution to 800x600.",
"formats #{nick}'s harddrive to fat12.",
"rm -rf's #{nick}.",
"stabs #{nick}.",
"makes #{nick} learn C++.",
"steals #{nick}'s mojo.",
"strangles #{nick} with a doohicky mouse cord.",
"whacks #{nick} with the cluebat.",
"sells #{nick} on EBay.",
"drops creepers on #{nick}'s house.",
"throws all of #{nick}'s diamond gear into lava.",
"uses #{nick} as a biological warfare study.",
"uses the 'Customer Appreciation Bat' on #{nick}.",
"puts #{nick} in the Total Perspective Vortex.",
"casts #{nick} into the fires of Mt. Doom.",
"gives #{nick} a melvin.",
"turns #{nick} over to the Fun Police.",
"turns over #{nick} to Agent Smith to be 'bugged'.",
"takes away #{nick}'s internet connection.",
"pushes #{nick} past the Shoe Event Horizon.",
"counts '1, 2, 5... er... 3!' and hurls the Holy Handgrenade Of Antioch at #{nick}.",
"puts #{nick} in a nest of camel spiders.",
"makes #{nick} read slashdot at -1.",
"puts 'alias vim=emacs' in #{nick}'s /etc/profile.",
"uninstalls every web browser from #{nick}'s system.",
"locks #{nick} in the Chateau d'If.",
"signs #{nick} up for getting hit on the head lessons.",
"makes #{nick} try to set up a Lexmark printer.",
"fills #{nick}'s eyedrop bottle with lime juice.",
"casts #{nick} into the fires of Mt. Doom.",
"gives #{nick} a Flying Dutchman.",
"rips off #{nick}'s arm, and uses it to beat them to death.",
"pierces #{nick}'s nose with a rusty paper hole puncher.",
"pokes #{nick} with a rusty nail.",
"puts sugar between #{nick}'s bedsheets.",
"pours sand into #{nick}'s breakfast.",
"mixes epoxy into #{nick}'s toothpaste.",
"puts Icy-Hot in #{nick}'s lube container.",
"straps #{nick} to a chair, and plays a endless low bitrate MP3 loop of \"the world's most annoying sound\" from \"Dumb and Dumber\".",
"tells Dr. Dre that #{nick} was talking smack.",
"forces #{nick} to use a Commodore 64 for all their word processing.",
"puts #{nick} in a room with several heavily armed manic depressives.",
"makes #{nick} watch reruns of \"Blue's Clues\".",
"puts lye in #{nick}'s coffee.",
"introduces #{nick} to the clue-by-four.",
"tattoos the Windows symbol on #{nick}'s ass.",
"lets Borg have his way with #{nick}.",
"signs #{nick} up for line dancing classes at the local senior center.",
"wakes #{nick} out of a sound sleep with some brand new nipple piercings.",
"gives #{nick} a 2 gauge Prince Albert.",
"forces #{nick} to eat all their veggies.",
"covers #{nick}'s toilet paper with lemon-pepper.",
"fills #{nick}'s ketchup bottle with Dave's Insanity sauce.",
"forces #{nick} to stare at an incredibly frustrating and seemingly never-ending IRC political debate.",
"knocks two of #{nick}'s teeth out with a 2x4.",
"removes Debian from #{nick}'s system.",
"switches #{nick} over to CentOS.",
"uses #{nick}'s iPod for skeet shooting practice.",
"gives #{nick}'s phone number to Borg.",
"posts #{nick}'s IP, username(s), and password(s) on 4chan.",
"forces #{nick} to use words like 'irregardless' and 'administrate' (thereby sounding like a real dumbass).",
"tickles #{nick} until they wet their pants and pass out.",
"replaces #{nick}'s KY with elmer's clear wood glue.",
"replaces #{nick}'s TUMS with alka-seltzer tablets.",
"squeezes habanero pepper juice into #{nick}'s tub of vaseline.",
"forces #{nick} to learn the Win32 API.",
"gives #{nick} an atomic wedgie.",
"ties #{nick} to a chair and forces them to listen to 'N Sync at full blast.",
"forces #{nick} to use notepad for text editing.",
"frowns at #{nick} really, really hard.",
"jabs a hot lighter into #{nick}'s eye sockets.",
"forces #{nick} to browse the web with IE6.",
"takes #{nick} out at the knees with a broken pool cue.",
"forces #{nick} to listen to emo music.",
"lets a few creepers into #{nick}'s house.",
"signs #{nick} up for the Iowa State Ferret Legging Championship.",
"attempts to hotswap #{nick}'s RAM.",
"dragon punches #{nick}.",
"puts railroad spikes into #{nick}'s side.",
"replaces #{nick}'s Astroglide with JB Weld.",
"replaces #{nick}'s stress pills with rat poison pellets.",
"replaces #{nick}'s crotch itch cream with Nair.",
"does the Australian Death Grip on #{nick}.",
"dances upon the grave of #{nick}'s ancestors.",
"farts in #{nick}'s general direction.",
"flogs #{nick} with stinging nettle.",
"intoduces #{nick} to the Knights who say Ni.",
"hands #{nick} a poison ivy joint."
]

puts "[me]" + wreck.sample