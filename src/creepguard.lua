local detector = peripheral.find("player_detector") or error("No Player Detector Found",0)
local relay = peripheral.find("redstone_relay") or error("No Relay Found", 0)

DETECTOR_RANGE = 10
REDSTONE_OUTPUT_SIDE = "top"
DOOR_OPEN_TIME = 3
WHITELIST_PATH = "./whitelist.txt"
BLACKLIST_PATH = "./blacklist.txt"

local playersInRange = detector.getPlayersInRange(RANGE)

local whitelist = readList(WHITELIST_PATH)

for _,name in ipairs(whitelist) do
   if name == playersInRange[1] then
      print("Opening door...")
      relay.setOutput(OUTPUT_SIDE, true)
      sleep(DOOR_TIME)
      relay.setOutput(OUTPUT_SIDE, false)
   else
      print("No access...")
      -- print screen
   end
end

function readList(path)
   local list = {}
   local file = fs.open(path, "r")
   
   if file then
      for line in file:lines() do
      	  table.insert(list, line)
      end
      file:close()
   else
      error("File Not Found")
   end

   return list
end
