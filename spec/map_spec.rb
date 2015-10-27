require 'spec_helper'

describe "Map" do

	describe "#new" do
		
		before do
			@map = GameOfLife::Map.new
		end

		it "creates an instance of Map" do
			expect(@map).to be_instance_of GameOfLife::Map
		end

		it "initializes its width to 10 cells" do
			expect(@map.width).to be == 10
		end

		it "initializes its height to 10 cells" do
			expect(@map.height).to be == 10
		end

		it "initializes map dimensions to parameters" do
			map = GameOfLife::Map.new(25,25)
			expect(map.width).to be == 25
			expect(map.height).to be == 25
		end

	end

	describe "#[]" do

		it "returns the state of a single Cell within Map" do
			map = GameOfLife::Map.new(1,1)
			map[0,0].state = :live
			expect(map[0,0].state).to be == :live
			map[0,0].state = :dead
			expect(map[0,0].state).to be == :dead
		end


	end

	describe "#to_s" do
		
		it "returns a string representation of Map" do
			map = GameOfLife::Map.new(2,2)
			expect(map.to_s).to be == "..\n..\n"
			map[1,0].state = :live
			expect(map.to_s).to be == ".#\n..\n"
		end

	end	

	describe "#deep_copy" do
		
		it "creates a complete copy of Map" do
			map = GameOfLife::Map.new(2,2)
			copy_map = map.deep_copy
			copy_map[0,0].state = :live
			expect(map[0,0].state).to be == :dead
		end

	end

	describe "#next_generation" do
	
		it "advances generations correctly" do
			map = GameOfLife::Map.new(2,2)
			map[0,0].state = :live
			map[0,1].state = :live
			map[1,0].state = :live
			map = map.next_generation
			expect(map.to_s).to be == "##\n##\n"

			map = GameOfLife::Map.new(2,2)
			map[0,0].state = :live
			map[1,1].state = :live
			map = map.next_generation
			expect(map.to_s).to be == "..\n..\n"

			map = GameOfLife::Map.new(3,3)
			map[0,0].state = :live
			map[1,1].state = :live
			map[2,2].state = :live
			map = map.next_generation
			expect(map.to_s).to be == "...\n.#.\n...\n"
		end

	end

	describe "#from_s" do
		
		it "doesn't change internal state if passed an empty string" do
			map = GameOfLife::Map.new(2,2)
			map.from_s("")
			expect(map.to_s).to be == "..\n..\n"
		end

		it "creates a Map based on a valid string" do
			map = GameOfLife::Map.new(1,1)
			map.from_s ".#.#\n#.#.\n.#.#\n#.#.\n"
			expect(map.to_s).to be == ".#.#\n#.#.\n.#.#\n#.#.\n"
		end

		it "detects width and height correctly" do
			map = GameOfLife::Map.new(1,1)
			map.from_s ".....\n.....\n"
			expect(map.width).to be == 5
			expect(map.height).to be == 2
		end

	end

end
