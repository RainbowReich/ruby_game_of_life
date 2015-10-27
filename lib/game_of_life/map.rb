require_relative './cell'

module GameOfLife

	# Represents a 2-dimensional collection of Cells
	class Map
		
		include Enumerable

		attr_reader :width, :height
		attr_accessor :cells

		def initialize(width=10, height=10)
			@width, @height = width, height	
			@cells = Array.new(@width) { Array.new(@height) { GameOfLife::Cell.new } }
		end

		def [](x,y)
			@cells[y].nil? || y < 0	|| x < 0 ? [] : @cells[y][x]
		end

		def []=(x,y, value)
			@cells[y][x] = value
		end

		
		def each &block
			@cells.each do |x| 
				x.each do |cell| 
					yield cell
				end
			end
		end

		def to_s
			result_string = ""
			@cells.each do |x|
				x.each do |cell|
					result_string += cell.to_s
				end
				result_string += "\n"
			end
			result_string	
		end

		def from_s(map)
			return if map.empty?
			new_cells = []
			new_row = []
			map.each_char do |c|
				case c
				when "."
					new_row << GameOfLife::Cell.new(:dead)
				when "#"
					new_row << GameOfLife::Cell.new(:live)
				when "\n"
					new_cells << new_row.dup
					new_row = []
				end
			end
			@cells = new_cells
			@width = new_cells[0].length
			@height = new_cells.size
		end

		def next_generation
			next_map = deep_copy
			for y in 0..@height-1 do
				for x in 0..@width-1 do
					neighbors = [self[x-1,y-1],
								 self[x,y-1],
								 self[x+1,y-1],
								 self[x-1,y],
								 self[x+1,y],
								 self[x-1,y+1],
								 self[x,y+1],
								 self[x+1,y+1]].flatten.keep_if { |n| !n.nil? }
					next_map[x,y].update_state neighbors 
				end
			end
			next_map
		end

		def next_generation!
			next_map = next_generation
			@cells = next_map.cells
		end

		def deep_copy
			copy_map = self.dup
			copy_map.cells = Marshal.load(Marshal.dump(@cells))	
			copy_map
		end

	end

end
