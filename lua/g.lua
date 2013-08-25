local http = require "socket.http"
local json = require "json"

-- get data
out = arg[1]:gsub(" ", "+")

if not out:match("%w") then
    return("This command requires an argument")
else
    local nae,code,tab = http.request{url=("https://www.google.com/search?site=&source=hp&q=%s&oq=r&btnI=1"):format(out),
                            redirect = false};
    if (nae and code~=403 and code~=404 and tab.location) then
        print(tab.location)
    else
        print("Error with google request.");
    end
end
