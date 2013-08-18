#!/usr/bin/env lua

require("socket")

function repspace(main, first, second)
    local relapsed = string.sub(main, 1, string.find(main, first) -1 )
    --
    local temp = string.sub(main, string.find(main, first) + #first)
    relapsed = relapsed .. second .. temp
    
    while string.find(relapsed, first) do
    temp = string.sub(relapsed, string.find(relapsed, first) + #first)
    relapsed = string.sub(relapsed, 1, string.find(relapsed, first) -1 )
    
    relapsed = relapsed .. second .. temp
    end
    
    return relapsed
end

function getpage(url)
    local http = require("socket.http") -- this is included with luasocket
    local page = {}
    local page, status = http.request(url) -- 1 = body, 2 = status?
    if verbose then print(page, status) end
    return page
end

if arg[2] then
    argz = arg[2]
else
    argz = arg[1]
end

local page = getpage('http://www.last.fm/user/' .. argz)
        for l in page:gmatch("[^\r\n]+") do
            if l:find('a href="/music/') then
            local tit = l:sub((l:find('a href="/music/')+15), #l)
            local title = tit:sub(1, (tit:find('"')-1))
            if title:find('+') then title = repspace(title, '+', ' ') end
            if title:find('/') then title = repspace(title, '/', '') end
            if title:find('_') then title = repspace(title, '_', ' -- ') end
            print(argz .. " last listened to: " .. title)
            return
        end
end

