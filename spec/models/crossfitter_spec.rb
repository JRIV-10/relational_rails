require "rails_helper"

RSpec.describe Crossfitter do 
    it {should belong_to :gym}

    describe "Index only shows crossfitters that have oly lifts true" do 
        it "#self.crossfitters_true" do 
        gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
        joey = gym_1.crossfitters.create!(name: "Joey", oly_lift: true, age: 25)
        roman = gym_1.crossfitters.create!(name: "Roman", oly_lift: false, age: 20)
        troy = gym_1.crossfitters.create!(name: "troy", oly_lift: true, age: 67)

        expect(Crossfitter.crossfitters_true).to eq([joey, troy])
        end
    end
end