class Life_for_site 
	def neighbors(x, y)
		num_n=0
		i=x
		j=y
		if i>0 && j>0 && @life_map[i-1][j-1] == 'X'
				num_n+=1
		end
		if i>0 && @life_map[i-1][j] == 'X'
				num_n+=1
		end
		if i>0 && j<@m && @life_map[i-1][j+1] == 'X'
				num_n+=1
		end
		if j>0 && @life_map[i][j-1] == 'X'
				num_n+=1
		end
		if j<(@m-1) && @life_map[i][j+1] == 'X'
				num_n+=1
		end
		if i<(@n-1) && j>0 && @life_map[i+1][j-1] == 'X'
				num_n+=1
		end
		if i<(@n-1) && @life_map[i+1][j] == 'X'
				num_n+=1
		end
		if i<(@n-1) && j<(@m-1) && @life_map[i+1][j+1] == 'X'
				num_n+=1
			end	
		return num_n
	end

	def filling_alive( )
		(0...@n).each do |i|
			(0...@m).each do |j|
				if rand(2) == 0 
					@life_map[i][j] = '.'
				else 
					@life_map[i][j] = 'X'
				end
			end
		end	
	end

	def creating_life()
		@life_map = []
		(0...@n).each do |i|
			@life_map[i] = []
			(0...@m).each do |j|
				@life_map[i] << '.'
			end 
		end

		@life_map_change = []
		(0...@n).each do |i|
			@life_map_change[i] = []
			(0...@m).each do |j|
				@life_map_change[i] << '.'
			end 
		end
	end

	def game_over()
		if  @life_map == @life_map_change 
			return true
		end
	end

	def next_step()
		num = 0
		
		(0...@n).each do |i|
				(0...@m).each do |j|
						num = neighbors(i,j)
						if num == 3 && @life_map[i][j] == '.'
							@life_map_change[i][j] = 'X'
						elsif (num < 2 || num > 3) && @life_map[i][j] == 'X'
							@life_map_change[i][j] = '.'
						else
							@life_map_change[i][j] = @life_map[i][j] 
						end							
				end 
		end
		(0...@n).each do|i|
			(0...@m).each do|j|
				@life_map[i][j] = @life_map_change[i][j]
			end
		end
		return @life_map
	end

	def start_life(x_size, y_size)

		@n = x_size
		@m = y_size
		gen = 0

		creating_life()
		filling_alive()
		return @life_map
		
	end
	#game_of_life(40,70)
end