local shell = require ("shell")
local json = require ("dkjson")

local ls = os.execute("ls")
print ( ls )

local tbl = {
  animals = { "dog", "cat", "aardvark" },
  instruments = { "violin", "trombone", "theremin" },
  bugs = json.null,
  trees = nil
}

local str = json.encode (tbl, { indent = true })

print (str)
