local C = cheetah
local playerBody = C.newImage('player.png')

if lQuery then
	function E:player(x, y)
		self.x = x
		self.y = y
		self.sx = 0
		self.sy = 0
		self:draw(function(self)
			playerBody:drawxy(-playerBody.w/2, -playerBody.h/2, playerBody.w/2, playerBody.h/2)
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

