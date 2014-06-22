require 'dxruby'

rachel_x = rachel_y = 320
rachel_image = Image.load("BC004_Rachel.png")
lobelia_x = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
lobelia_y = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1]
lobelia_image = Image.load("lobelia.png")

hazama_x = hazama_y = 0
hazama_move = 8
hazama_image = Image.load("CB014_Hazama.png")

class Player
	def initialize(player_x, player_y, player_image)
		@player_x = player_x
		@player_y = player_y 
		@player_image = player_image
	end
	def play_manager
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
	end
end
# class Enemy


# 	hazama_x = hazama_x + hazama_move
# 	if hazama_x < 0 or hazama_x > 680 - hazama_image.width - hazama_move then
# 		hazama_y = hazama_y + hazama_move
# 		hazama_move = -hazama_move		
# 	end
# 	Window.draw(hazama_x, hazama_y, hazama_image)
# end

rachel = Player.new(rachel_x, rachel_y, rachel_image)
# rachel.init(rachel_x, rachel_y, rachel_image)

Window.loop do
	# rachel_x = rachel_x + Input.x*5
	# rachel_y = rachel_y + Input.y*5
	
	# if rachel_x < 0 then
	# 	rachel_x = 0
	# end
	# if rachel_x > 640 - rachel_image.width then
	# 	rachel_x = 640 - rachel_image.width
	# end
	# if rachel_y < 0 then
	# 	rachel_y = 0
	# end
	# if rachel_y > 480 - rachel_image.height then
	# 	rachel_y = 480 - rachel_image.height
	# end 
	# Window.draw(rachel_x, rachel_y, rachel_image)
	rachel.play_manager
	if Input.keyPush?(K_Z) == true then
		for i in 0..9 do
			if lobelia_y[i] < 0 then
				lobelia_x[i] = rachel_x
		 		lobelia_y[i] = rachel_y
		 		break
		 	end
		end
	end
	for i in 0..9 do
		if lobelia_y[i] >= 0 then
			lobelia_y[i] = lobelia_y[i] - 8
			Window.draw(lobelia_x[i], lobelia_y[i], lobelia_image)
			if lobelia_y[i] >= 0 and
				lobelia_x[i] - (hazama_x + hazama_image.width - 1) < 0 and 
				lobelia_y[i] - (hazama_y + hazama_image.height - 1) < 0 and
				hazama_x - (lobelia_x[i] + lobelia_image.width - 1) < 0 and 
				hazama_y - (lobelia_y[i] + lobelia_image.height - 1) < 0 then
					hazama_x = hazama_y = 0
					lobelia_x[i] = lobelia_y[i] = -1
			end
	 	end
	end

	hazama_x = hazama_x + hazama_move
	if hazama_x < 0 or hazama_x > 680 - hazama_image.width - hazama_move then
		hazama_y = hazama_y + hazama_move
		hazama_move = -hazama_move		
	end
	Window.draw(hazama_x, hazama_y, hazama_image)
end
