require 'lib.cheetah'
require "lib.lquery.entity"
require 'lib.lquery.init'

local C = cheetah
C.init('Test', 800, 600, 32, 'v')
require 'player'

E:new(screen):player(400, 300)

C.mainLoop()
