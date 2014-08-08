load 'BulletManager.rb'

class PlayerManager
	def initialize
		@rachel = Rachel.new
	end
	def player_manager
		@rachel.draw
		@rachel.move
		@rachel.shoot
	end
end
class PlayerMaker
	def draw
		Window.draw(@player_x, @player_y, @player_image)
	end
	def move
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
	end
end
class Rachel < PlayerMaker
	def initialize
		@player_x = 320
		@player_y = 320

		@player_image = Image.load("BC004_Rachel.png")
		#@rachel = Sprite.new(@player_x, @player_y, Image.new(30, 30, @player_image))
		@lobelia = Lobelia.new
	end
	def shoot
		@lobelia.draw(@player_x, @player_y)
		@lobelia.move
	end
end
