require 'dxruby'

rachel_x = rachel_y = 320
rachel_image = Image.load("BC004_Rachel.png")
rachel_initial = [rachel_x, rachel_y, rachel_image]
rachel_coordinate = []

lobelia_x = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
lobelia_y = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
lobelia_image = Image.load("lobelia.png")
lobelia_initial = [lobelia_x, lobelia_y, lobelia_image]

hazama_x = hazama_y = 0
hazama_image = Image.load("CB014_Hazama.png")
hazama_move = 8
hazama_initial = [hazama_x, hazama_y, hazama_image, hazama_move]
hazama_coordinate = []

class SystemManager
	def hit_checks(objectA_x, objectA_y, objectA_image, objectB_x, objectB_y, objectB_image)
		if objectA_x - (objectB_x + objectB_image.width - 1) < 0 and 
			objectA_y - (objectB_y + objectB_image.height - 1) < 0 and
			objectB_x - (objectA_x + objectA_image.width - 1) < 0 and 
			objectB_y - (objectA_y + objectA_image.height - 1) < 0 then
				# objectB_x = objectB_y = 0
				# objectA_x = objectA_y = -1
				print "hit!"
		end
	end
end

class PlayerManager
	def initialize(player_initial, bullet_initial)
		@player_x = player_initial[0]
		@player_y = player_initial[1]
		@player_image = player_initial[2]
		@bullet_x = bullet_initial[0]
		@bullet_y = bullet_initial[1]
		@bullet_image = bullet_initial[2]
	end
	def player_make(object_coordinate)
		@player_x = @player_x + Input.x*5
		@player_y = @player_y + Input.y*5
	
		if @player_x < 0 then
			@player_x = 0
		end
		if @player_x > 640 - @player_image.width then
			@player_x = 640 - @player_image.width
		end
		if @player_y < 0 then
			@player_y = 0
		end
		if @player_y > 480 - @player_image.height then
			@player_y = 480 - @player_image.height
		end 
		Window.draw(@player_x, @player_y, @player_image)

		bullet_manager = BulletManager.new(@bullet_x, @bullet_y, @bullet_image)
		bullet_manager.bullet_make(@player_x, @player_y, 8, object_coordinate)
		return @player_x, @player_y, @player_image
	end
end

class EnemyManager
	def initialize(enemy_initial)
		@enemy_x = enemy_initial[0]
		@enemy_y = enemy_initial[1]
		@enemy_image = enemy_initial[2]
		@enemy_move = enemy_initial[3]
	end
	def enemy_make
		@enemy_x = @enemy_x + @enemy_move
		if @enemy_x < 0 or @enemy_x > 680 - @enemy_image.width - @enemy_move then
			@enemy_y = @enemy_y + @enemy_move
			@enemy_move = -@enemy_move		
		end
		Window.draw(@enemy_x, @enemy_y, @enemy_image)
		return @enemy_x, @enemy_y, @enemy_image
	end
end

class BulletManager
	def initialize(bullet_x, bullet_y, bullet_image)
		@bullet_x = bullet_x
		@bullet_y = bullet_y
		@bullet_image = bullet_image
	end
	def bullet_make(chara_x, chara_y, bullet_speed, object_coordinate)
		if Input.keyPush?(K_Z) == true then
			for i in 0..9 do
				if @bullet_y[i] < 0 then
					@bullet_x[i] = chara_x
		 			@bullet_y[i] = chara_y
		 			break
		 		end
			end
		end
		for i in 0..9 do
			if @bullet_y[i] >= 0 then
				@bullet_y[i] = @bullet_y[i] - bullet_speed
				Window.draw(@bullet_x[i], @bullet_y[i], @bullet_image)
				if @bullet_y[i] >= 0 and
					system = SystemManager.new()
					system.hit_checks(@bullet_x[i], @bullet_y[i], @bullet_image, object_coordinate[0], object_coordinate[1], object_coordinate[2])
				end
	 		end
		end
	end
end

rachel = PlayerManager.new(rachel_initial, lobelia_initial)
hazama = EnemyManager.new(hazama_initial)

Window.loop do
	rachel_coordinate = rachel.player_make(hazama_coordinate)
	hazama_coordinate = hazama.enemy_make
end
