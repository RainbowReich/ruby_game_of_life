module GameOfLife
	
	#Represents a single cell in a Game of Life
	class Cell 

		attr_accessor :state

		def initialize(state = :dead)
			@state = state
		end

		def update_state(neighbors)
			live_neighbors = neighbors.select { |cell| cell.state == :live }
			case live_neighbors.size
			when 0..1
				@state = :dead
			when 3
				@state = :live
			when 4..8
				@state = :dead
			end
			self
		end

		def to_s
			case @state
			when :live
				"#"
			when :dead
				"."
			end	
		end

	end

end
