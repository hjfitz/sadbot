local json = require("json")
local http = require("socket.http")
local url = require("socket.url")

if arg[2] then
    user = arg[2]
else
    user = arg[1]
end

local mt = {}   
 
for line in io.lines'./data/lastdb' do
    local nrow = {}
    for n in line:gmatch'%S+' do
        table.insert(nrow, tostring(n))
    end
    if #nrow > 0 then
        table.insert(mt, nrow)
    end
end

for i = 1,#mt do
    if mt[i][1] == arg[1] then
        row = i
    end
end                                                                                   

if row and not arg[2] then
    user = mt[row][2]
end 

local c = http.request(string.format("http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=%s&api_key=493c4be2f2d8d02dd3016d6c008e3886&format=json", user))
local result = json.decode(c) or false

if result.message then
    print("No user with that name was found")
elseif not result.recenttracks.total then
    song = result.recenttracks.track[1].name
    artist = result.recenttracks.track[1].artist["#text"]
    album = result.recenttracks.track[1].album["#text"]

    print("11" .. 
        user .. "0" .. " last listened to: " .. "4" .. 
        song .. "0" .. " by " .. "12" .. 
        artist .. "0" .. " from " .. "13" ..
        album .. "0"
    )
else
    print("No songs to display")
end

