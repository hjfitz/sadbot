local json = require("json")
local http = require("socket.http")
local url = require("socket.url")
--[[
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
--]]
--[[
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
--]]

location = string.gsub(arg[1]," ","_")

local c = http.request("http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20geo.places%20where%20text%3D%22" .. location .. "%22&format=json")
local result = json.decode(c) or false

if #result.query.results.place > 1 then
    woeid = result.query.results.place[1].woeid
else
    woeid = result.query.results.place.woeid
end

if arg[2] == "f" or arg[2] == "F" then
    unit = "f"
else
    unit = "c"
end

local d = http.request("http://query.yahooapis.com/v1/public/yql?q=%20select%20*%20from%20weather.forecast%20where%20woeid%3D%22" .. woeid .. "%22%20%20and%20u%3D%22" .. unit .. "%22%20&format=json&diagnostics=true&callback=")
local q = json.decode(d)
dunit = "°" .. q.query.results.channel.units.temperature
ctemp = q.query.results.channel.item.condition.temp .. dunit
htemp = q.query.results.channel.item.forecast[1].high  .. dunit
ltemp = q.query.results.channel.item.forecast[1].low .. dunit
condition = q.query.results.channel.item.forecast[1].text
location = q.query.results.channel.location.city .. ", " .. q.query.results.channel.location.country

print("The current temperature in " .. location .. " is " .. ctemp .. " (high: " .. htemp .. ", low: " .. ltemp .. ") It is currently " .. condition .. ".")
