local json = require("json")
local http = require("socket.http")
local url = require("socket.url")

if arg[2] then                  --set arguments to user variable
    user = arg[2]
else
    user = arg[1]
end

local mt = {}   
 
for line in io.lines'./data/lastdb' do      -- make a two dimensional array from the database file
    local nrow = {}                         -- containing the irc nick in the first dimension and
    for n in line:gmatch'%S+' do            -- the lastfm name in the second
        table.insert(nrow, tostring(n))
    end
    if #nrow > 0 then
        table.insert(mt, nrow)
    end
end

for i = 1,#mt do                            -- searches array for line containing the nick
    if mt[i][1] == arg[1] then
        row = i
    end
end                                                                                   

if row and not arg[2] then                  -- gets the second dimension (the corresponding lastfm name)
    user = mt[row][2]
end 

local c = http.request(string.format("http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=%s&api_key=493c4be2f2d8d02dd3016d6c008e3886&format=json", user))
local result = json.decode(c) or false      -- json hackery that returns a table using the lastfm json api

if result.message then                                                  -- checks if user exists
    print("No user with that name was found")
elseif not result.recenttracks.total then                               -- checks if user actually has previous tracks
    song = result.recenttracks.track[1].name
    artist = result.recenttracks.track[1].artist["#text"]
    album = result.recenttracks.track[1].album["#text"]

    print("11" ..                                                     -- prints coloured output
        user .. "0" .. " is now listening to: " .. "4" .. 
        song .. "0" .. " by " .. "12" .. 
        artist .. "0" .. " from " .. "13" ..
        album .. "0"
    )
else
    print("No songs to display")
end

