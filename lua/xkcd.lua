-- modules
local http = require 'socket.http'
local url  = require 'socket.url'
local json = require 'json'

-- get data
local result
local suc = pcall(function()
    result = http.request("http://www.xkcd.com/" .. (arg[1] and arg[1] .. '/' or '') ..'info.0.json')
    result = json.decode(result)
    result = result.title .. " -> " .. result.img
end)

if suc then
    print(result)
else
    print("Invalid comic")
end
