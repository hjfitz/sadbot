-- modules
local http = require "socket.http"
local json = require "json"

arg[1] = arg[1]:gsub(" ", "_")

function trim(s)
    return s:find'^%s*$' and '' or s:match'^%s*(.*%S)'
end

if not arg[1] then
    print("This command requires an argument")
else
    local result = http.request("http://api.urbandictionary.com/v0/define?term=" .. arg[1])
    local result = json.decode(result)
        if(#result.list > 0) then
            print(arg[1] .. ": " .. trim(result.list[1].definition:gsub('\r\n', ' ')))
        end
end

