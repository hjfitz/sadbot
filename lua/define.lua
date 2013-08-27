local json = require("json")
local http = require("socket.http")
local url = require("socket.url")

query = arg[2]

local c = http.request(string.format("http://www.google.com/dictionary/json?callback=a&sl=en&tl=en&q=%s", query))
local c = string.sub(c, 3,-11)
print(c)
local result = json.decode(c) or false      -- json hackery that returns a table using the lastfm json apii

type = string.lower(result.primaries[1].terms[1].labels[1].text)

definition = result.primaries[1].entries[2].terms[1].text

print(query .. " (" .. type .. ") " .. definition)
