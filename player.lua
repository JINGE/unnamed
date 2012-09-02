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
			if (keyPressed('w')) self.sy = -1
			if (keyPressed('s')) self.sy = 1
			if (keyPressed('a')) self.sx = -1
			if (keyPressed('d')) self.sx = 1
			
			if (keyReleased('w')) self.sy = 0
			if (keyReleased('s')) self.sy = 0
			if (keyReleased('a')) self.sx = 0
			if (keyReleased('d')) self.sx = 0
			
			self._body:drawxy(-_body.w/2, -_body.h/2, _body.w/2, _body.h/2)
			self.x = self.x + self.sx
			self.y = self.y + self.sy
		end)
	end
end
