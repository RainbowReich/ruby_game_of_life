require 'spec_helper'
describe "Cell" do

	describe "#new" do

		before do
			@cell = GameOfLife::Cell.new
		end

		it "creates a new instance of Cell" do
			expect(@cell).to be_instance_of GameOfLife::Cell
		end
		
		it "initializes its state to :dead" do
			expect(@cell.state).to be == :dead
		end
		
		it "initializes its state with parameter" do
			cell = GameOfLife::Cell.new(:live)
			expect(cell.state).to be == :live
		end

	end

	describe "#update_state" do

		describe "when Cell is alive," do

			before do
				@cell = GameOfLife::Cell.new(:live)
				@neighbors = Array.new(8) { GameOfLife::Cell.new }
			end	

			it "dies with 0 neighbors" do
				@cell.update_state(@neighbors)
				expect(@cell.state).to be == :dead	
			end

			it "dies with 1 neighbor" do
				@neighbors[0] = GameOfLife::Cell.new(:live) 
				@cell.update_state(@neighbors)
				expect(@cell.state).to be == :dead
			end

			it "lives with 2 neighbors" do
				@neighbors[0..1] = Array.new(2) { GameOfLife::Cell.new(:live) }
				@cell.update_state(@neighbors)
				expect(@cell.state).to be == :live
			end

			it "lives with 3 neighbors" do
				@neighbors[0..2] = Array.new(3) { GameOfLife::Cell.new(:live) }
				@cell.update_state(@neighbors)
				expect(@cell.state).to be == :live
			end
			
			it "dies with 4 neighbors" do
				@neighbors[0..3] = Array.new(4) { GameOfLife::Cell.new(:live) }
				@cell.update_state(@neighbors)
				expect(@cell.state).to be == :dead
			end

			it "dies with 5 neighbors" do
				@neighbors[0..4] = Array.new(5) { GameOfLife::Cell.new(:live) }
				@cell.update_state(@neighbors)
				expect(@cell.state).to be == :dead
			end

			it "dies with 6 neighbors" do
				@neighbors[0..5] = Array.new(6) { GameOfLife::Cell.new(:live) }
				@cell.update_state(@neighbors)
				expect(@cell.state).to be == :dead
			end

			it "dies with 7 neighbors" do
				@neighbors[0..6] = Array.new(7) { GameOfLife::Cell.new(:live) }
				@cell.update_state(@neighbors)
				expect(@cell.state).to be == :dead
			end

			it "dies with 8 neighbors" do
				@neighbors[0..7] = Array.new(8) { GameOfLife::Cell.new(:live) }
				@cell.update_state(@neighbors)
				expect(@cell.state).to be == :dead
			end

		end

		describe "when Cell is dead," do

			before do
				@cell = GameOfLife::Cell.new(:dead)
				@neighbors = Array.new(8) { GameOfLife::Cell.new }
			end	

			it "stays dead with 0 neighbors" do
				@cell.update_state(@neighbors)
				expect(@cell.state).to be == :dead	
			end

			it "stays dead with 1 neighbor" do
				@neighbors[0] = GameOfLife::Cell.new(:live) 
				@cell.update_state(@neighbors)
				expect(@cell.state).to be == :dead
			end

			it "stays dead with 2 neighbors" do
				@neighbors[0..1] = Array.new(2) { GameOfLife::Cell.new(:live) }
				@cell.update_state(@neighbors)
				expect(@cell.state).to be == :dead
			end

			it "lives with 3 neighbors" do
				@neighbors[0..2] = Array.new(3) { GameOfLife::Cell.new(:live) }
				@cell.update_state(@neighbors)
				expect(@cell.state).to be == :live
			end
			
			it "stays dead with 4 neighbors" do
				@neighbors[0..3] = Array.new(4) { GameOfLife::Cell.new(:live) }
				@cell.update_state(@neighbors)
				expect(@cell.state).to be == :dead
			end

			it "stays dead with 5 neighbors" do
				@neighbors[0..4] = Array.new(5) { GameOfLife::Cell.new(:live) }
				@cell.update_state(@neighbors)
				expect(@cell.state).to be == :dead
			end

			it "stays dead with 6 neighbors" do
				@neighbors[0..5] = Array.new(6) { GameOfLife::Cell.new(:live) }
				@cell.update_state(@neighbors)
				expect(@cell.state).to be == :dead
			end

			it "stays dead with 7 neighbors" do
				@neighbors[0..6] = Array.new(7) { GameOfLife::Cell.new(:live) }
				@cell.update_state(@neighbors)
				expect(@cell.state).to be == :dead
			end

			it "stays dead with 8 neighbors" do
				@neighbors[0..7] = Array.new(8) { GameOfLife::Cell.new(:live) }
				@cell.update_state(@neighbors)
				expect(@cell.state).to be == :dead
			end
			
		end

	end

	describe "#to_s" do
		
		it "returns '#' when Cell is alive" do
			cell = GameOfLife::Cell.new(:live)
			expect(cell.to_s).to be == "#"	
		end

		it "returns '.' when Cell is dead" do
			cell = GameOfLife::Cell.new(:dead)
			expect(cell.to_s).to be == "."
		end

	end

end
