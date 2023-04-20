local LFJokes = CreateFrame("frame", "EventFrame")

-- decode the joke
local function decode(s)
   return (s:gsub("[A-Za-z]", function (c)
       local offset = c:lower() < "n" and 13 or -13
       return string.char(c:byte() + offset)
   end))
end


EventUtil.ContinueOnAddOnLoaded("Blizzard_Calendar", function()
   CalendarViewEventAcceptButton:HookScript("OnClick", function()
      j = decode(jokes[math.random(#jokes)])
      SendChatMessage(j, "GUILD") 
   end
   )
end)
