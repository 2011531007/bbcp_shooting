require 'dxruby'
load 'PlayerManager.rb'
load 'EnemyManager.rb'

rachel = PlayerManager.new
hazama = EnemyManager.new
BuckGround = Image.load("BG008.jpg")

Window.loop do
	Window.draw(0, 0, BuckGround)
	rachel.player_manager
	hazama.enemy_manager
end
