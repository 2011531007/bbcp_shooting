# class BulletManager
# 	def bullet_manager
# 		lobelia = Lobelia.new()
# 		lobelia.draw
# 		lobelia.move
# 	end
# end
class BulletMaker
end
class Lobelia < BulletMaker
	def initialize
		@bullet_x = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
		@bullet_y = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
		@bullet_image = Image.load("lobelia.png")
		@bullet_speed = 8
	end 
	def draw(player_x, player_y)
		@player_x = player_x
		@player_y = player_y
		if Input.keyPush?(K_Z) == true then
			@bullet_y.size.times do |i|
				if @bullet_y[i] < 0 then
					@bullet_x[i] = @player_x
		 			@bullet_y[i] = @player_y
		 			break
		 		end
			end
		end
	end
	def move
		@bullet_y.size.times do |i|
			if @bullet_y[i] >= 0 then
				Window.draw(@bullet_x[i], @bullet_y[i], @bullet_image)
				@bullet_y[i] = @bullet_y[i] - @bullet_speed
	 		end
		end
	end
end