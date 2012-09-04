require "lib.cheetah"
require "lib.lquery.entity"

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
		end)
		self:keypress(function(self, key)
			if key == 'w' then
				self.sy = -1
			elseif key == 's' then
				self.sy = 1
			elseif key == 'a' then
				self.sx = -1
			elseif key == 'd' then
				self.sx = 1
			end
		end)
		self:keyrelease(function(self, key)
			if key == 'w' then
				self.sy = 0
			elseif key == 's' then
				self.sy = 0
			elseif key == 'a' then
				self.sx = 0
			elseif key == 'd' then
				self.sx = 0
			end
		end)
	end
end

