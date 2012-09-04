require 'lib.cheetah'
require 'player'

local C = cheetah
C.init('Test', 800, 600, 32, '')

E:new(screen):player(400, 300):move(100,100)

C.mainLoop()
