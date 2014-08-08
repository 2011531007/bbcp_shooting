load 'BulletManager.rb'

class EnemyManager
	def initialize
		@hazama = Hazama.new
		@relius = Relius.new
	end
	def enemy_manager
		@hazama.draw
		@hazama.move
	end
end
class EnemyMaker
	def draw
		Window.draw(@enemy_x, @enemy_y, @enemy_image)
	end
end
class Hazama < EnemyMaker
	def initialize
		@enemy_x = 0
		@enemy_y = 0
		@enemy_image = Image.load("CB014_Hazama.png")
		@enemy_speed = 8
		@enemy_hp = 1
	end
	def move
		@enemy_x = @enemy_x + @enemy_speed
		if @enemy_x < 0 or @enemy_x > 680 - @enemy_image.width - @enemy_speed then
			@enemy_y = @enemy_y + @enemy_speed
			@enemy_speed = -@enemy_speed
		end
	end
end
class Relius < EnemyMaker
	def initialize
		relius_image = Image.load("CB019_Relius.png")
		relius = Sprite.new(60, 120, relius_image)
	end



end