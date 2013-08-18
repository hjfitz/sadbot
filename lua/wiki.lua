-- modules
local http = require "socket.http"
local json = require "json"

-- get data
if arg[3] then
    arg[2] = arg[2] .. " " .. arg[3]
end

arg[2] = arg[2]:gsub(" ", "_")

if not arg[2] then
    return("This command requires an argument")
else
    local result = http.request("http://en.wikipedia.org/w/api.php?action=query&prop=info&inprop=url&format=json&titles=" .. arg[2])
    local result = json.decode(result)
    if (result and result.query and result.query.pages) then
        local result = select(2, next(result.query.pages))
        if not (result and result.title and result.fullurl) then
            return("Error with wikipedia request")
        end
        -- format data
        print(result.title .. " -> " .. result.fullurl)
    else
        print("Error with wikipedia request.");
    end
end

