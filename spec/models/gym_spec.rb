require "rails_helper" 

RSpec.describe Gym do 
    it {should have_many :crossfitters}

    describe Gym, type: :model do 
        describe "#order_by" do 
            it "orders gyms by when they are created" do 
                gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                gym_2 = Gym.create!(name: "Iron Fitness", always_open: false, num_of_platforms: 25)
        
                expect(Gym.ordered).to eq([gym_2, gym_1])
            end 
        end

        describe "#counted" do 
            it "counts the crossfitters at the gym" do                 
                gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                gym_2 = Gym.create!(name: "Iron Fitness", always_open: false, num_of_platforms: 25)
                gym_1.crossfitters.create!(name: "Joey", oly_lift: true, age: 25)

                expect(gym_1.counted).to eq(1)
            end
        end

        describe "#self.ordered_alphabetical" do 
            it "sorts the crossfitters alphabetically" do 
                gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
                joey = gym_1.crossfitters.create!(name: "Joey", oly_lift: true, age: 25)
                aaron = gym_1.crossfitters.create!(name: "Aaron", oly_lift: false, age: 77)
                beans = gym_1.crossfitters.create!(name: "Beans", oly_lift: true, age: 29)

                expect(gym_1.ordered_alphabetical).to eq([aaron, beans, joey])
            end
        end
    end
end