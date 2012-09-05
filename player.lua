local C = cheetah
-- Take care that you init graphics before this
-- It caused by inability to create OpenGL textures
-- before initializing OpenGL itself
local playerBody = C.newImage('player.png')

if lQuery then
	-- In this function we construct our character
	function E:player(x, y)
		-- Set translition and transformation to defaults
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
			playerBody:drawt(
				self.x, self.y,
				playerBody.w, playerBody.h,
				-- 0 radians is according to positive X-axis
				-- but 'player.png' aims on top. So, we need
				-- to additional rotate image in PI/2
				self.rotation+math.pi/2,
				-- initial entity center is top-left corner
				-- and we should move center
				playerBody.w/2, playerBody.h/2
			)
			-- and make it move
			self.x = self.x + self.sx
			self.y = self.y + self.sy
			-- and rotate
			-- at first we need to get vector from character
			-- mouse, then calculate arctangent of some angle
			-- of a rectangulant triangle
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
	
	-- Now we can create entity by calling E:new()
	-- and then make it player by :player()
	-- For example E:new(screen):player(400, 300)
end

