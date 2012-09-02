require "lib.cheetah"
require "lib.lQuery"

local C = cheetah

if lQuery then
	function E:player(x, y)
		self.x = 0
		self.y = 0
		self.sx = 0
		self.sy = 0
		self._body = C.newImage('player.png');
		self:draw(function(self)
			self._body:drawxy(-_body.w/2, -_body.h/2, _body.w/2, _body.h/2)
			self.x = self.x + self.sx
			self.y = self.y + self.sy
			--if (self.sx > 0) self.sx = self.sx - 1
			--if (self.sx < 0) self.sx = self.sx + 1
			--if (self.sy > 0) self.sy = self.sy - 1
			--if (self.sy < 0) self.sy = self.sy + 1
		end)
		function self:processKeys(param, keyType, keyValue)
			if (keyType == 'kp') {
				if (keyValue = 'w') self.sy = -1
				if (keyValue = 's') self.sy = 1
				if (keyValue = 'a') self.sx = -1
				if (keyValue = 'd') self.sx = 1
			} else {
				if (keyValue = 'w') self.sy = 0
				if (keyValue = 's') self.sy = 0
				if (keyValue = 'a') self.sx = 0
				if (keyValue = 'd') self.sx = 0
			}
		end
	end
end
