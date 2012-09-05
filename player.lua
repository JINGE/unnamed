local C = cheetah
local playerBody = C.newImage('player.png')
local L = lQuery

if lQuery then
	-- In this function we construct our character
	function E:player(x, y)
		-- Set default translition and transformation
		self.x = x
		self.y = y
		self.rotation = 0
		-- Default speed
		self.sx = 0
		self.sy = 0
		-- This function is a callback whitch called
		-- each time our char is drawing
		self:draw(function(self)
			-- Here we draw armor image of our char
			playerBody:drawt(self.x, self.y, playerBody.w, playerBody.h, self.rotation, -playerBody.w/2, -playerBody.h/2)
			-- and make it move
			self.x = self.x + self.sx
			self.y = self.y + self.sy
			-- and rotate
			local dx = lQuery.mX - self.x
			local dy = lQuery.mY - self.y
			self.rotation = math.atan2(dy, dx)
		end)
		-- Serve keypresses, update speed
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
		-- On some key' release make our player stay
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

